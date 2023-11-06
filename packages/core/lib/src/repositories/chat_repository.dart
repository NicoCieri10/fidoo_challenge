import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

/// Repository for managing the chat.
class ChatRepository {
  static CollectionReference get _collection => _firebase.collection('chats');
  static FirebaseFirestore get _firebase => FirebaseFirestore.instance;

  /// Method to get a [ChatEntitie] by contactId.
  Future<ChatEntitie?> getChatByContact(String contactId) async {
    try {
      final data = await _collection
          .where(
            'contactId',
            isEqualTo: contactId,
          )
          .get();
      if (data.docs.isEmpty) return null;

      final chat = data.docs.first;

      return ChatEntitie.fromMap(chat.data() as Map<String, dynamic>? ?? {});
    } catch (e) {
      log('ChatRepository error: $e');
      return null;
    }
  }

  /// Method for send a [Message].
  Future<bool> sendMessage({
    required Message message,
    required String chatId,
  }) async {
    try {
      await _collection.doc(chatId).update({
        'messages': FieldValue.arrayUnion([message.toMap()]),
      });

      return true;
    } catch (e) {
      log('ChatRepository error: $e');
      return false;
    }
  }
}
