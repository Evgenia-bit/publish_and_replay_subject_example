import 'package:publish_and_replay_subject_example/services/i_chat_service.dart';
import 'package:rxdart/subjects.dart';

/// Реализация [IChatService] с использованием [PublishSubject].
class PublishChatService implements IChatService {
  /// Создаем PublishSubject для хранения сообщений.
  final PublishSubject<String> _subject = PublishSubject();

  /// Определяем геттер для получения потока с сообщениями.
  /// После подписки клиент будет получать все поступающие в поток сообщения.
  @override
  Stream<String> get messageStream => _subject.stream;

  @override
  void sendMessage(String message) {
    /// Отправляем сообщение в поток.
    _subject.add(message);
  }
}
