import 'package:choco/core/theme.dart';
import 'package:choco/firebase_options.dart';
import 'package:choco/screens/home/home.dart';
import 'package:choco/core/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Import the generated file
// import 'firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]); 
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

