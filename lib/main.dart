import 'package:choco/core/theme.dart';
import 'package:choco/screens/home/home.dart';
import 'package:choco/core/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChocoApp());
}

class ChocoApp extends StatelessWidget {
  const ChocoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: AppTheme.theme,
      home: const Home(),
    );
  }
}

