import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getData();
  }

  List<String> chats = [];
  TextEditingController chat = TextEditingController();
  sendMessage() {
    chats.add(chat.text);
    chat.clear();
    notifyListeners();
  }

  List<ChatModel> listChat = [];
  getData() async {
    Dio dio = Dio();
    final response = await dio.get("https://tegaldev.metimes.id/chat-sample");
    final results = jsonDecode(response.data);
    for (Map<String, dynamic> i in results['data']) {
      listChat.add(ChatModel.fromJson(i));
    }
    notifyListeners();
    print(listChat.length);
  }
}
