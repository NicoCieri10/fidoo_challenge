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
    Message(
      text: 'Hi!',
      time: DateTime.now(),
      senderId: '2',
      sender: Sender.other,
    ),
    Message(
      text: 'How are you?',
      time: DateTime.now(),
      senderId: '2',
      sender: Sender.other,
    ),
    Message(
      text: 'Fine',
      time: DateTime.now(),
      senderId: '3',
      sender: Sender.other,
    ),
  ];

  final contacts = [
    const Contact(
      avatarUrl:
          'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp',
      id: '1',
      name: 'Juan',
      online: true,
    ),
    const Contact(
      avatarUrl:
          'https://thumbs.dreamstime.com/b/vectores-de-imagen-perfil-avatar-masculino-desconocido-empresario-vectorial-179373829.jpg',
      id: '2',
      name: 'Nico',
      online: false,
    ),
    const Contact(
      avatarUrl:
          'https://cdn5.vectorstock.com/i/1000x1000/73/04/female-avatar-profile-icon-round-woman-face-vector-18307304.jpg',
      id: '3',
      name: 'Agus',
      online: true,
    ),
  ];

  List<Message> getMessages(String userId) {
    return messages
        .where(
          (element) => element.senderId == userId || element.senderId == '0',
        )
        .toList();
  }

  void sendMessage(Message message) {
    messages.add(message);
  }

  List<Contact> getContacts() {
    return contacts;
  }
}
