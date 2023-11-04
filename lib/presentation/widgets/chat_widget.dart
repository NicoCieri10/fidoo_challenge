import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(this.contact, {super.key});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        ChatScreen.route,
        pathParameters: {'contactId': contact.id},
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(contact.avatarUrl),
              ),
              const SizedBox(width: 20),
              Text(
                contact.name,
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
