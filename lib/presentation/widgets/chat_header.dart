import 'package:fidooo_challenge/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader(this.chatEntitie, {super.key});

  final ChatEntitie chatEntitie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
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

class _ContactImage extends StatelessWidget {
  const _ContactImage(this.chatEntitie);

  final ChatEntitie chatEntitie;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Colors.white,
          height: 55,
          width: 55,
          child: Image.network(
            chatEntitie.avatarUrl,
            fit: BoxFit.contain,
          ),
        ),
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
          child: Observer(
            builder: (_) => Text(
              chatEntitie.contactName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            if (chatEntitie.online) {
              return const _StatusRow(
                text: 'Online',
                dotColor: Colors.green,
              );
            } else {
              return const _StatusRow(
                text: 'Offline',
                dotColor: Colors.grey,
              );
            }
          },
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
