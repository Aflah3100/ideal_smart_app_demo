import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle poppins(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
