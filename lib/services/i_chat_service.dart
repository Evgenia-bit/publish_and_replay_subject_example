/// Интерфейс сервиса для работы с сообщениями.
abstract interface class IChatService {
  /// Stream с сообщениями.
  Stream<String> get messageStream;

  /// Метод отправки сообщения в чат.
  void sendMessage(String message);
}
