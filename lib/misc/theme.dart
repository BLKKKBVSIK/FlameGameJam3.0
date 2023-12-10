import 'package:flutter/material.dart';

class GameTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(headlineLarge: TextStyle(color: Colors.white)),
      );
}
