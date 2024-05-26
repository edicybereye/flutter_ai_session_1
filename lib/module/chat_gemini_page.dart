import 'package:flutter/material.dart';
import 'package:flutter_ai/module/chat_gemini_notifier.dart';
import 'package:provider/provider.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatGeminiPage extends StatelessWidget {
  const ChatGeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatGeminiNotifier(context: context),
      child: Consumer<ChatGeminiNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey[300],
          body: Center(
            child: Container(
              color: Colors.white,
              child: DashChat(
                currentUser: value.currentUser,
                onSend: value.sendMessage,
                messages: value.listMessage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
