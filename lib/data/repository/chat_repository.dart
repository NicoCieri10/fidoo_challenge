import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/models/models.dart';

class ChatRepository {
  final messages = [
    Message(
      text: 'Hi!',
      time: DateTime.now(),
      senderId: '1',
      sender: Sender.other,
    ),
    Message(
      text: 'How are you?',
      time: DateTime.now(),
      senderId: '1',
      sender: Sender.other,
    ),
    Message(
      text: 'Fine',
      time: DateTime.now(),
      senderId: '0',
      sender: Sender.user,
    ),
  ];

  final contacts = [
    const Contact(
      avatarUrl:
          'https://i.pinimg.com/564x/fb/a1/f8/fba1f8d46d07866fbbd520be71f73087.jpg',
      id: '1',
      name: 'Juan',
      online: true,
    ),
    const Contact(
      avatarUrl:
          'https://i.pinimg.com/564x/fb/a1/f8/fba1f8d46d07866fbbd520be71f73087.jpg',
      id: '2',
      name: 'Juan',
      online: true,
    ),
  ];

  List<Message> getMessages(String userId) {
    return messages;
  }

  void sendMessage(Message message) {
    messages.add(message);
  }

  List<Contact> getContacts() {
    return contacts;
  }
}
