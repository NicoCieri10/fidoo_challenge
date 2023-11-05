// import 'package:fidooo_challenge/domain/domain.dart';
import 'package:fidooo_challenge/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader(this.chatEntitie, {super.key});

  final ChatEntitie chatEntitie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      color: theme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 7,
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              const _BackButton(),
              _ContactImage(chatEntitie),
              const SizedBox(width: 20),
              _ContactInfo(chatEntitie),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.pop,
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.white,
    );
  }
}

class _ContactImage extends StatelessWidget {
  const _ContactImage(this.chatEntitie);

  final ChatEntitie chatEntitie;

  @override
  Widget build(BuildContext context) {
    final image = chatEntitie.contact?.avatarUrl;

    return Hero(
      tag: chatEntitie.contact?.id ?? '',
      child: CircleAvatar(
        radius: 30,
        backgroundImage: image != null
            ? NetworkImage(image)
            : const NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo(this.chatEntitie);

  final ChatEntitie chatEntitie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          child: Text(
            chatEntitie.contact?.name ?? 'No name',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        chatEntitie.contact?.online ?? false
            ? const _StatusRow(
                text: 'Online',
                dotColor: Colors.green,
              )
            : const _StatusRow(
                text: 'Offline',
                dotColor: Colors.grey,
              ),
      ],
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.text,
    required this.dotColor,
  });

  final String text;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor,
          ),
        ),
      ],
    );
  }
}
