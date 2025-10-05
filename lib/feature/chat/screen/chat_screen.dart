import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/chat_controller.dart';
import '../widget/message_bubble.dart';
import '../widget/chat_input_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      builder: (context, _) {
        final controller = context.watch<ChatController>();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "This is ",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: "Ameen",
                    style: TextStyle(
                      color: Color(0xFF00AA5B),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "! Your AI assistant.",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.messages.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final msg = controller.messages[index];
                      final isUser = msg["role"] == "user";
                      return MessageBubble(
                        text: msg["text"] ?? "",
                        isUser: isUser,
                      );
                    },
                  ),
                ),
                ChatInputField(
                  controller: controller.textController,
                  onSend: controller.sendMessage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
