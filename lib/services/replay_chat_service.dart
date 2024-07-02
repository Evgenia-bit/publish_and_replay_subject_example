import 'package:publish_and_replay_subject_example/services/i_chat_service.dart';
import 'package:rxdart/subjects.dart';

/// Реализация [IChatService] с использованием [ReplaySubject].
class ReplayChatService implements IChatService {
  /// Создаем [ReplaySubject] для хранения сообщений.
  final ReplaySubject<String> _subject = ReplaySubject();

  /// Определяем геттер для получения потока с сообщениями.
  /// При подписке клиент получит все сообщения, которые были когда-либо добавлены в поток.
  /// Потом, подобно примеру с [PublishSubject], подписчик будет получать сообщения,
  /// которые поступают в поток.
  @override
  Stream<String> get messageStream => _subject.stream;

  @override
  void sendMessage(String message) {
    /// Отправляем сообщение в поток.
    _subject.add(message);
  }
}
