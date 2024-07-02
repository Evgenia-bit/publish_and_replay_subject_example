import 'package:flutter/material.dart';
import 'package:publish_and_replay_subject_example/screens/main_screen.dart';
import 'package:publish_and_replay_subject_example/services/replay_chat_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
