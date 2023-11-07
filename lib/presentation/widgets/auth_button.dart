import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
  });

  final void Function()? onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 180,
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading
            ? const LoadingWidget()
            : Text(
                text,
                style: const TextStyle(fontSize: 22),
              ),
      ),
    );
  }
}
