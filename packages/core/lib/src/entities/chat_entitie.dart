import 'dart:developer';

import 'package:core/core.dart';

class ChatEntitie {
  final String id;
  final Contact? contact;
  final String? contactId;
  final List<Message> messages;

  ChatEntitie({
    required this.id,
    this.contact,
    this.contactId,
    required this.messages,
  });

  factory ChatEntitie.fromMap(Map<String, dynamic> json) {
    try {
      return ChatEntitie(
        id: json['id'] as String,
        contact: json['contact'] == null
            ? null
            : Contact.fromMap(json['contact'] as Map<String, dynamic>),
        contactId: json['contactId'] as String,
        messages: (json['messages'] as List<dynamic>)
            .map((e) => Message.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log('ChatEntitie error: $e');
      return ChatEntitie(
        id: '',
        messages: [],
      );
    }
  }
}
