import 'package:core/core.dart';

class ChatEntitie {
  final String id;
  final Contact? contact;
  final List<Message> messages;

  ChatEntitie({
    required this.id,
    this.contact,
    required this.messages,
  });
}
