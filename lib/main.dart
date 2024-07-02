import 'package:flutter/material.dart';
import 'package:publish_and_replay_subject_example/screens/main_screen.dart';
import 'package:publish_and_replay_subject_example/services/replay_chat_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _chatService = ReplayChatService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(
        chatService: _chatService,
      ),
    );
  }
}
