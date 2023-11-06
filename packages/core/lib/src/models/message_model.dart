import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

enum Sender {
  user,
  other,
}

class Message {
  const Message({
    required this.text,
    required this.time,
    this.sender,
  });

  final String text;
  final DateTime time;
  final Sender? sender;

  factory Message.fromMap(Map<String, dynamic> json) {
    try {
      return Message(
        text: json['text'] as String,
        time: (json['time'] as Timestamp).toDate(),
        sender: json['sender'] == 'user' ? Sender.user : Sender.other,
      );
    } catch (e) {
      log('Message error: $e');
      return Message(
        text: '',
        time: DateTime.now(),
      );
    }
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'time': time,
        'sender': sender == Sender.user ? 'user' : 'other',
      };
}
