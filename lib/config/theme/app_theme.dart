import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.teal,
        cardColor: Colors.teal[100],
      );
}
