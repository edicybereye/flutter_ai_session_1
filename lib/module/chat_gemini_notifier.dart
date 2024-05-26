import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatGeminiNotifier extends ChangeNotifier {
  final BuildContext context;

  ChatGeminiNotifier({required this.context});
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> listMessage = [];
  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "Edi Kurniawan",
  );
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
  );

  sendMessage(ChatMessage value) {
    listMessage = [value, ...listMessage];
    // listMessage.add(value);
    try {
      String values = value.text;
      gemini.streamGenerateContent(values).listen((event) {
        String response = event.content!.parts
                ?.fold("", (before, after) => "$before ${after.text}") ??
            '';
        ChatMessage resultMessage = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response,
        );
        listMessage = [resultMessage, ...listMessage];
        notifyListeners();
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
