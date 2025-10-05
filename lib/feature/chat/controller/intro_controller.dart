import 'package:flutter/material.dart';
import 'package:hackathon/feature/chat/screen/chat_screen.dart';

class IntroController {
  final BuildContext context;
  IntroController(this.context);

  // ✅ Option data list (makes it easy to modify)
  final List<Map<String, String>> optionData = [
    {
      "image": "assets/images/ListChecks.png",
      "text": "Create a To-Do List for moving to Saudi",
    },
    {
      "image": "assets/images/ListNumbers.png",
      "text": "How do I start investing in Saudi?",
    },
    {
      "image": "assets/images/MoneyWavy.png",
      "text": "What’s the process for renting a house?",
    },
  ];

  // ✅ Go back
  void goBack() {
    Navigator.pop(context);
  }

  // ✅ Navigate to chat
  void goToChat() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ChatScreen()),
    );
  }

  // ✅ AppBar title
  Widget buildAppBarTitle() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "This is ",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          TextSpan(
            text: "Ameen",
            style: TextStyle(
              color: Color(0xFF00AA5B),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "! Your AI assistant.",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ✅ Chatbot avatar
  Widget buildChatbotAvatar() {
    return Center(
      child: ClipOval(
        child: Image.asset(
          "assets/images/Untitled_Artwork 17 1.png",
          width: 141,
          height: 214,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ✅ Greeting text
  Widget buildGreetingText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: "Hey ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const TextSpan(
              text: "Vikram",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700, // bold for Vikram
                color: Colors.black,
              ),
            ),
            const TextSpan(
              text: "!\nHow may I help you today?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Bottom input container
  Widget buildBottomInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 20),
      child: GestureDetector(
        onTap: goToChat,
        child: Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Paperclip.png",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                "Ask a question or make a request...",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
