// import 'package:fidooo_challenge/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class ChatHeader extends StatelessWidget {
  // const ChatHeader(this.chatEntitie, {super.key});
  const ChatHeader({
    super.key,
    required this.contactName,
    required this.avatarUrl,
    required this.online,
  });

  // final ChatEntitie chatEntitie;
  final String contactName;
  final String avatarUrl;
  final bool online;

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
              // _ContactImage(chatEntitie),
              _ContactImage(avatarUrl),
              const SizedBox(width: 20),
              // _ContactInfo(chatEntitie),
              _ContactInfo(
                contactName: contactName,
                online: online,
              ),
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
  // const _ContactImage(this.chatEntitie);
  const _ContactImage(this.avatarUrl);

  // final ChatEntitie chatEntitie;
  final String avatarUrl;

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
            // chatEntitie.avatarUrl,
            avatarUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  // const _ContactInfo(this.chatEntitie);
  const _ContactInfo({
    required this.contactName,
    required this.online,
  });

  // final ChatEntitie chatEntitie;
  final String contactName;
  final bool online;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          child: Observer(
            builder: (_) => Text(
              // chatEntitie.contactName,
              contactName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            if (online) {
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
