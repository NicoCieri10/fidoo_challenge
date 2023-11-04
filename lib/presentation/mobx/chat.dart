import 'package:fidooo_challenge/data/repository/repository.dart';
import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/models/models.dart';
import 'package:mobx/mobx.dart';

part 'chat.g.dart';

final _chatRepository = ChatRepository();

/// Store for managing the chat screen.
class Chat = ChatStore with _$Chat;

abstract class ChatStore with Store {
  @observable
  String contactId = '';

  @observable
  Contact? contact;

  @observable
  List<Contact> contacts = [];

  @observable
  String userId = '0';

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  @action
  void sendMessage(String value) {
    final message = Message(
      text: value,
      time: DateTime.now(),
      senderId: userId,
      sender: Sender.user,
    );
    // messages.add(message);
    _chatRepository.sendMessage(message);
    getMessages();
  }

  @action
  void getMessages() {
    messages.clear();
    final newMessages = ObservableList<Message>.of(
      _chatRepository.getMessages(contactId),
    );
    messages.addAll(newMessages);
    messages.sort((a, b) => a.time.compareTo(b.time));
  }

  @action
  void getContacts() {
    contacts = _chatRepository.getContacts();
  }

  @action
  void setContactId(String value) {
    contactId = value;
    contacts = _chatRepository.getContacts();
    contact = contacts.firstWhere((element) => element.id == value);
    getMessages();
  }
}
