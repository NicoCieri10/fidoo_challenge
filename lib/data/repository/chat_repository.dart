import 'package:fidooo_challenge/models/models.dart';

class ChatRepository {
  List<Message> getMessages(String userId) {
    final messages = [
      Message(
        text: 'Hi!',
        time: DateTime.now(),
        senderId: '1',
      ),
      Message(
        text: 'How are you?',
        time: DateTime.now(),
        senderId: '1',
      ),
    ];

    return messages;
  }

  void sendMessage(Message message) {
    print(message);
  }
}
