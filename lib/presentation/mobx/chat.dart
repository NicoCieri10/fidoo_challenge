import 'package:core/core.dart';
import 'package:mobx/mobx.dart';

part 'chat.g.dart';

final _chatRepository = ChatRepository();
final _contactsRepository = ContactsRepository();

/// Store for managing the chat screen.
class Chat = ChatStore with _$Chat;

abstract class ChatStore with Store {
  @observable
  bool loading = false;

  @observable
  String contactId = '';

  @observable
  String chatId = '';

  @observable
  Contact? contact;

  @observable
  List<Contact> contacts = [];

  @observable
  String userId = '0';

  @observable
  List<Message> messages = [];

  @computed
  ChatEntitie get getChatData => ChatEntitie(
        contact: contact,
        messages: messages,
        contactId: contactId,
        id: chatId,
      );

  @action
  void sendMessage(String value) {
    final message = Message(
      text: value,
      time: DateTime.now(),
      sender: Sender.user,
    );
    messages.add(message);
    _chatRepository.sendMessage(
      message: message,
      chatId: chatId,
    );
  }

  @action
  Future<void> getChat() async {
    loading = true;

    final chat = await _chatRepository.getChatByContact(contactId);
    if (chat == null) return;

    chatId = chat.id;
    setMessages(chat.messages);

    loading = false;
  }

  @action
  void setMessages(List<Message> newMessages) {
    messages.clear();
    messages.addAll(newMessages);
    messages.sort((a, b) => a.time.compareTo(b.time));
  }

  @action
  Future<void> getContacts() async =>
      contacts = await _contactsRepository.getContacts();

  @action
  Future<void> setContactId(String value) async {
    loading = true;

    contactId = value;
    contact = await _contactsRepository.getContactById(value);
    await getChat();

    loading = false;
  }
}
