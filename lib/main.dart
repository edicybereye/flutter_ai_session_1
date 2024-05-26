import 'package:flutter/material.dart';
import 'package:flutter_ai/const.dart';
import 'package:flutter_ai/module/chat_gemini_page.dart';
import 'package:flutter_ai/module/home_page.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(
    apiKey: geminiApiKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatGeminiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
