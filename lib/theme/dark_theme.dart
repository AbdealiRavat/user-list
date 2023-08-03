import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.workSans().fontFamily,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900
  )
  );
