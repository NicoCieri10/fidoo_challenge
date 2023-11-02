import 'package:fidooo_challenge/models/models.dart';

class ChatEntitie {
  final String id;
  final String contactName;
  final List<Message> messages;
  final bool online;
  final String avatarUrl;

  ChatEntitie({
    required this.id,
    required this.contactName,
    required this.messages,
    required this.online,
    required this.avatarUrl,
  });
}
