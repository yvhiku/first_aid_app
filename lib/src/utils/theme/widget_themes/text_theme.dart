import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(color: Colors.black87, fontSize: 18),
    headlineSmall: GoogleFonts.poppins(color: Colors.black87, fontSize: 14),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(color: Colors.white70, fontSize: 18),
    headlineSmall: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
  );
}
