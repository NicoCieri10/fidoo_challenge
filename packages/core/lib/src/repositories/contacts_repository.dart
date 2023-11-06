import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

class ContactsRepository {
  static CollectionReference get _collection =>
      _firebase.collection('contacts');
  static FirebaseFirestore get _firebase => FirebaseFirestore.instance;

  Future<List<Contact>> getContacts() async {
    try {
      final data = await _collection.get();
      if (data.docs.isEmpty) return [];
      log('data docs ${data.docs}');

      final contacts = data.docs
          .map(
            (e) => Contact.fromMap(
              e.data() as Map<String, dynamic>? ?? {},
            ),
          )
          .toList();

      log('contacts $contacts');
      return contacts;
    } catch (e) {
      log('ContactsRepository error: $e');
      return [];
    }
  }
}
