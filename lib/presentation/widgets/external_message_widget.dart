import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ExternalMessageWidget extends StatelessWidget {
  const ExternalMessageWidget(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final time = '${message.time.hour}:${message.time.second}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
