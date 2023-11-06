import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

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
    final Home home = Home();
    home.getContacts();

    return Observer(
      builder: (_) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: home.contacts.length,
        itemBuilder: (context, index) => ChatWidget(home.contacts[index]),
      ),
    );
  }
}
