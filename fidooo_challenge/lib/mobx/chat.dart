import 'package:fidooo_challenge/domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'chat.g.dart';

/// Store for managing the chat screen.
class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  /// The current chat message.
  @observable
  String id = '';

  @observable
  String message = '';

  @observable
  String contactName = '';

  @observable
  bool online = false;

  @observable
  String avatarUrl = '';

  /// The current chat message.
  @action
  void setMessage(String value) => message = value;

  /// The current chat message.
  @computed
  ChatEntitie get getChatData => ChatEntitie(
        id: id,
        contactName: contactName,
        message: message,
        online: online,
        avatarUrl: avatarUrl,
      );
}
