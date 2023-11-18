import 'package:flutter/material.dart';
import 'package:choco/core/colors.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme{
  
static ThemeData theme=   ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amberAccent,

          ),
        scaffoldBackgroundColor:mainColor,
        appBarTheme: const AppBarTheme(backgroundColor:mainColor),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge:GoogleFonts.exo2(fontSize: 18,fontWeight: FontWeight.bold),
bodySmall:GoogleFonts.exo(fontSize: 12,),
        )
      );
}