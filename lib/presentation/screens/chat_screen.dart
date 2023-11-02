import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const String route = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Chat chat = Chat();

  @override
  Widget build(BuildContext context) {
    final chatEntitie = chat.getChatData;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ChatHeader(chatEntitie),
            // Expanded(
            //   child: _ChatBody(),
            // ),
            // _ChatInput(),
          ],
        ),
      ),
    );
  }
}
