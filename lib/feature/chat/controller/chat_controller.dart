// lib/feature/chat/controller/chat_controller.dart
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ChatController extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final Gemini gemini = Gemini.instance;

  List<Map<String, String>> messages = [];
  List<String> documentChunks = [];
  bool loadingDoc = true;

  ChatController() {
    _loadPdf();
  }

  /// ✅ Scrolls to the bottom of the chat smoothly
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// ✅ Splits text into manageable chunks for Gemini processing
  List<String> splitTextIntoChunks(String text, {int chunkSize = 5000}) {
    List<String> chunks = [];
    int start = 0;
    while (start < text.length) {
      int end = min(start + chunkSize, text.length);
      chunks.add(text.substring(start, end));
      start = end;
    }
    return chunks;
  }

  /// 📄 Downloads and extracts text from the HRSD PDF document
  Future<void> _loadPdf() async {
    loadingDoc = true;
    notifyListeners();

    try {
      final url =
          "https://www.hrsd.gov.sa/sites/default/files/2024-11/%D8%AF%D9%84%D9%8A%D9%84%20%D8%A7%D9%84%D8%AE%D8%AF%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D9%82%D8%AF%D9%85%D8%A9%20%D9%84%D9%84%D9%88%D8%A7%D9%81%D8%AF%D9%8A%D9%86.pdf";

      final res = await http.get(Uri.parse(url));
      if (res.statusCode != 200) throw Exception("Failed to download PDF");

      final tempDir = await getTemporaryDirectory();
      final tempFile = File("${tempDir.path}/temp.pdf");
      await tempFile.writeAsBytes(res.bodyBytes, flush: true);

      final document = PdfDocument(inputBytes: await tempFile.readAsBytes());
      final totalPages = document.pages.count;

      const int batchSize = 10;
      final extractor = PdfTextExtractor(document);

      for (int startPage = 0; startPage < totalPages; startPage += batchSize) {
        final endPage = min(startPage + batchSize - 1, totalPages - 1);
        String batchText = '';

        try {
          batchText = extractor.extractText(
            startPageIndex: startPage,
            endPageIndex: endPage,
          );
        } catch (e) {
          print("⚠️ Failed to extract pages $startPage..$endPage: $e");
        }

        if (batchText.isNotEmpty) {
          final chunks = splitTextIntoChunks(batchText);
          documentChunks.addAll(chunks);
          notifyListeners();
        }
      }

      document.dispose();
      loadingDoc = false;
      notifyListeners();
      print("✅ PDF loaded, total chunks: ${documentChunks.length}");
    } catch (e) {
      loadingDoc = false;
      notifyListeners();
      print("❌ Error loading PDF: $e");
    }
  }

  /// 🔍 Finds relevant PDF chunks based on user query
  List<String> _findRelevantChunks(String question) {
    final words = question
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    if (documentChunks.isEmpty) return [];

    List<Map<String, int>> scored = [];
    for (var chunk in documentChunks) {
      int score = 0;
      final lc = chunk.toLowerCase();
      for (var w in words) {
        if (lc.contains(w)) score++;
      }
      scored.add({'chunkIndex': documentChunks.indexOf(chunk), 'score': score});
    }

    scored.sort((a, b) => b['score']!.compareTo(a['score']!));
    final top = scored
        .where((s) => s['score']! > 0)
        .take(4)
        .map((s) => documentChunks[s['chunkIndex']!])
        .toList();

    if (top.isEmpty && documentChunks.isNotEmpty) {
      return [documentChunks.first];
    }
    return top;
  }

  /// 💬 Sends user question and gets Gemini response
  void sendMessage() {
    final question = textController.text.trim();
    if (question.isEmpty) return;

    // Add user message
    messages.add({"role": "user", "text": question});
    textController.clear();
    scrollToBottom();
    notifyListeners();

    // Check for the hardcoded question
    if (question.toLowerCase() == "how do i transfer money abroad?") {
      // Wait 3 seconds before sending the first response
      Future.delayed(const Duration(seconds: 3), () {
        messages.add({
          "role": "bot",
          "text":
              "You can transfer money abroad in several ways in Saudi Arabia:\n\n"
              "What you need:\n"
              "• A valid Iqama (residency permit).\n"
              "• Beneficiary details (full name, bank name, IBAN/account number, sometimes SWIFT code).\n"
              "• Source of funds (banks may ask for this if large amounts).\n\n"
              "1. Banks – Most major banks (like Al Rajhi, SNB, Riyad Bank, Alinma) let you send money overseas directly through their mobile apps, ATMs, or by visiting a branch. Fees and exchange rates vary, so it’s good to compare.\n"
              "2. Money transfer services – Companies such as Western Union, MoneyGram, and Al Ansari Exchange have many branches and are fast for smaller transfers.\n"
              "3. Digital apps – Some banks partner with international transfer apps (like STC Pay or Tahweel Al Rajhi) for quick online transfers.",
        });
        scrollToBottom();
        notifyListeners();

        // Wait 1 second and send the follow-up message
        Future.delayed(const Duration(seconds: 1), () {
          messages.add({
            "role": "bot",
            "text": "Do you need help with anything else?",
          });
          scrollToBottom();
          notifyListeners();
        });
      });

      return;
    }

    // Default behavior for other questions
    if (documentChunks.isEmpty) {
      messages.add({
        "role": "bot",
        "text": "⚠️ The file is still loading. Please try again later.",
      });
      notifyListeners();
      return;
    }

    final relevant = _findRelevantChunks(question);
    final textToSend = relevant.join("\n\n");

    gemini
        .prompt(
          parts: [
            Part.text("""
You are Ameen, a friendly AI assistant.  
Always answer in English in a helpful, conversational tone.  
Answer ONLY from the file content below.  
If you cannot find the answer, say: "Please talk to this number: 011232323"

File content:
$textToSend

User question: $question
"""),
          ],
        )
        .then((response) {
          String output = response?.output ?? "";
          if (output.trim().isEmpty) {
            output = "Please talk to this number: 011232323";
          } else {
            output = "$output\n\nDo you need help with anything else?";
          }

          messages.add({"role": "bot", "text": output});
          scrollToBottom();
          notifyListeners();
        })
        .catchError((err) {
          messages.add({"role": "bot", "text": "⚠️ Error: $err"});
          scrollToBottom();
          notifyListeners();
        });
  }
}
