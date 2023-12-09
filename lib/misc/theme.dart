import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      );
}
