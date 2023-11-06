import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

/// Repository for managing the chat.
class ChatRepository {
  static CollectionReference get _collection => _firebase.collection('chats');
  static FirebaseFirestore get _firebase => FirebaseFirestore.instance;

  /// Method for getting the [Message] list.
  Future<List<Message>?> getMessages(String userId) async {
    try {
      final data = await _collection.doc(userId).get();
      if (data.data() == null) return [];

      return <Message>[];
    } catch (e) {
      log('ChatRepository error: $e');
      return [];
    }
  }

  /// Method for send a [Message].
  void sendMessage(Message message) {
    final messages = [];
    messages.add(message);
  }
}
