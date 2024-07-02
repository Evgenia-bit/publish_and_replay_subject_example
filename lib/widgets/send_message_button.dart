import 'package:flutter/material.dart';

/// Кнопка отправки сообщения в чат.
class SendMessageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SendMessageButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.send),
      onPressed: onPressed,
    );
  }
}
