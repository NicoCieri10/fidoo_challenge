import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthLinkWidget extends StatelessWidget {
  const AuthLinkWidget({
    super.key,
    required this.question,
    required this.link,
    this.onTap,
  });

  final String question;
  final String link;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: question,
            style: const TextStyle(color: Colors.black),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: link,
            style: TextStyle(color: theme.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
