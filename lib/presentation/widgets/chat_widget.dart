import 'package:core/core.dart';
import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(this.contact, {super.key});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushNamed(
        // TODO: get chat before push
        ChatScreen.route,
        pathParameters: {'contactId': contact.id ?? ''},
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
              Hero(
                tag: contact.id ?? '',
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(contact.avatarUrl ??
                      'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                contact.name ?? 'No name',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
