import 'package:flutter/material.dart';
import 'package:publish_and_replay_subject_example/screens/chat_screen.dart';
import 'package:publish_and_replay_subject_example/services/i_chat_service.dart';
import 'package:publish_and_replay_subject_example/utils/message_util.dart';
import 'package:publish_and_replay_subject_example/widgets/send_message_button.dart';

/// Главный экран.
class MainScreen extends StatelessWidget {
  final IChatService chatService;
  const MainScreen({required this.chatService, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChatScreen(chatService: chatService),
              ),
            );
          },
          child: const Text('Открыть чат'),
        ),
      ),
      floatingActionButton: SendMessageButton(
        onPressed: () => chatService.sendMessage(MessageUtil.message),
      ),
    );
  }
}
