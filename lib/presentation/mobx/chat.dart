import 'package:core/core.dart';
import 'package:mobx/mobx.dart';

part 'chat.g.dart';

final _chatRepository = ChatRepository();
final _contactsRepository = ContactsRepository();

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

  @computed
  ChatEntitie get getChatData => ChatEntitie(
        contact: contact,
        messages: messages,
        id: contactId,
      );

  @action
  void sendMessage(String value) {
    final message = Message(
      text: value,
      time: DateTime.now(),
      senderId: userId,
      sender: Sender.user,
    );
    messages.add(message);
    _chatRepository.sendMessage(message);
  }

  @action
  void getMessages() async {
    messages.clear();
    final coreMessages = await _chatRepository.getMessages(contactId);
    final newMessages = ObservableList<Message>.of(coreMessages ?? []);
    messages.addAll(newMessages);
    messages.sort((a, b) => a.time.compareTo(b.time));
  }

  @action
  void getContacts() async =>
      contacts = await _contactsRepository.getContacts();

  @action
  void setContactId(String value) async {
    contactId = value;
    contacts = await _contactsRepository.getContacts();
    contact = contacts.firstWhere((element) => element.id == value);
    getMessages();
  }
}
