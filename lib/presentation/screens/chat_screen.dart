import 'package:core/core.dart';
import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    this.contactId = '',
  });

  final String? contactId;

  static const String route = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Chat chat = Chat();

  @override
  void initState() {
    super.initState();
    chat.setContactId(widget.contactId!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.background,
        body: Observer(
          builder: (_) => chat.loading
              ? const LoadingWidget()
              : Column(
                  children: [
                    ChatHeader(chat.getChatData),
                    _ChatBody(chat),
                    _ChatInput(
                      onValue: (value) =>
                          setState(() => chat.sendMessage(value)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ChatBody extends StatelessWidget {
  const _ChatBody(this.chat);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final chatScrollController = ScrollController();
    return Expanded(
      child: ListView.builder(
        controller: chatScrollController,
        itemCount: chat.messages.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        itemBuilder: (context, index) {
          final message = chat.messages[index];
          return (message.sender == Sender.user)
              ? MessageWidget(message)
              : ExternalMessageWidget(message);
        },
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput({required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final decoration = InputDecoration(
      filled: true,
      hintText: 'Mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final text = controller.value.text;
          controller.clear();
          onValue(text);
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (event) => focusNode.unfocus(),
        controller: controller,
        focusNode: focusNode,
        decoration: decoration,
        onFieldSubmitted: (value) {
          controller.clear();
          focusNode.requestFocus();
          onValue(value);
        },
      ),
    );
  }
}
