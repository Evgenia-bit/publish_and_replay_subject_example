import 'dart:async';

import 'package:flutter/material.dart';
import 'package:publish_and_replay_subject_example/services/i_chat_service.dart';
import 'package:publish_and_replay_subject_example/utils/message_util.dart';
import 'package:publish_and_replay_subject_example/widgets/send_message_button.dart';

/// Экран чата.
class ChatScreen extends StatefulWidget {
  final IChatService chatService;
  const ChatScreen({required this.chatService, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final StreamSubscription<String> _subscription;
  final ScrollController _scrollController = ScrollController();
  final _messages = <String>[];

  @override
  void initState() {
    super.initState();

    /// Подписываемся на поток с сообщениями.
    _subscription = widget.chatService.messageStream.listen(_listenChatStream);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чат')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          controller: _scrollController,
          itemCount: _messages.length,
          itemBuilder: (_, index) => _MessageWidget(message: _messages[index]),
        ),
      ),
      floatingActionButton: SendMessageButton(
        onPressed: () => widget.chatService.sendMessage(MessageUtil.message),
      ),
    );
  }

  /// Метод-слушатель потока. Срабатывает каждый раз, когда в поток поступает сообщение.
  void _listenChatStream(String message) {
    setState(() {
      _messages.add(message);
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}

class _MessageWidget extends StatelessWidget {
  final String message;

  const _MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(message),
          ),
        ),
      ),
    );
  }
}
