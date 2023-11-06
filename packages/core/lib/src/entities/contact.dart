import 'dart:developer';

class Contact {
  const Contact({
    this.name,
    this.id,
    this.avatarUrl,
    this.online,
  });

  final String? name;
  final String? id;
  final String? avatarUrl;
  final bool? online;

  factory Contact.fromMap(Map<String, dynamic> json) {
    try {
      return Contact(
        name: json['name'] as String,
        id: json['id'] as String,
        avatarUrl: json['avatarUrl'] as String,
        online: json['online'] as bool,
      );
    } catch (e) {
      log('Contact error: $e');
      return Contact();
    }
  }
}
