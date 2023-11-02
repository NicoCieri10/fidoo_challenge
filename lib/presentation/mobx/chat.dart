import 'package:fidooo_challenge/data/repository/repository.dart';
import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/models/models.dart';
import 'package:mobx/mobx.dart';

part 'chat.g.dart';

final chatRepository = ChatRepository();

/// Store for managing the chat screen.
class Chat = ChatStore with _$Chat;

abstract class ChatStore with Store {
  @observable
  String contactId = '1';

  @observable
  String contactName = 'Juan';

  @observable
  bool online = false;

  @observable
  String avatarUrl =
      'https://i.pinimg.com/564x/fb/a1/f8/fba1f8d46d07866fbbd520be71f73087.jpg';

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
    );
    messages.add(message);
    chatRepository.sendMessage(message);
  }

  @action
  void getMessages() {
    final newMessages = ObservableList<Message>.of(
      chatRepository.getMessages(contactId),
    );
    messages.addAll(newMessages);
    messages.sort((a, b) => a.time.compareTo(b.time));
  }

  @action
  void setContactId(String value) => contactId = value;

  @computed
  ChatEntitie get getChatData => ChatEntitie(
        id: contactId,
        contactName: contactName,
        messages: messages,
        online: online,
        avatarUrl: avatarUrl,
      );
}
