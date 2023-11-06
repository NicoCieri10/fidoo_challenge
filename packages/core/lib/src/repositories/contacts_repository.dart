import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

/// Repository for managing the chat.
class ContactsRepository {
  static CollectionReference get _collection =>
      _firebase.collection('contacts');
  static FirebaseFirestore get _firebase => FirebaseFirestore.instance;

  /// Method to get the [Contact] list.
  Future<List<Contact>> getContacts() async {
    try {
      final data = await _collection.get();
      if (data.docs.isEmpty) return [];

      final contacts = data.docs
          .map((e) => Contact.fromMap(e.data() as Map<String, dynamic>? ?? {}))
          .toList();

      return contacts;
    } catch (e) {
      log('ContactsRepository error: $e');
      return [];
    }
  }

  /// Method to get a [Contact] by id.
  Future<Contact?> getContactById(String id) async {
    try {
      final data = await _collection.doc(id).get();
      if (!data.exists) return null;

      return Contact.fromMap(data.data() as Map<String, dynamic>? ?? {});
    } catch (e) {
      log('ContactsRepository error: $e');
      return null;
    }
  }
}
