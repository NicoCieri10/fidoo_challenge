import 'package:flutter/material.dart';

/// Custom Text Form Field
class CustomField extends StatelessWidget {
  /// Custom Text Form Field
  const CustomField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.style,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.maxLength,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.onSaved,
    this.focusNode,
    this.autoFocus = false,
    this.readOnly = false,
    this.initialValue,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final int? maxLength;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black54,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );

    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.primary,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );

    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.error,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );

    final focusedError = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.error,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );

    final decoration = InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14.0),
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedError,
      suffixIcon: suffixIcon,
    );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: decoration,
      style: style,
      keyboardType: keyboardType,
      validator: validator,
      textAlign: textAlign,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autoFocus,
      maxLines: maxLines,
      readOnly: readOnly,
      initialValue: initialValue,
    );
  }
}
