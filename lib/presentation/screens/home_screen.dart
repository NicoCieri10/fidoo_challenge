import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fidooo Challenge',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.primary,
      ),
      body: const _ChatsList(),
    );
  }
}

class _ChatsList extends StatelessWidget {
  const _ChatsList();

  @override
  Widget build(BuildContext context) {
    final Chat chat = Chat();
    chat.getContacts();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: chat.contacts.length,
      itemBuilder: (context, index) => ChatWidget(chat.contacts[index]),
    );
  }
}
