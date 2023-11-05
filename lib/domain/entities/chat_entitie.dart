import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/models/models.dart';

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
