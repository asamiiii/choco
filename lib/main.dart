import 'package:choco/core/theme.dart';
import 'package:choco/data_source/local.dart';
import 'package:choco/firebase_options.dart';
import 'package:choco/providers.dart/provider.dart';
import 'package:choco/screens/home/home.dart';
import 'package:choco/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// Import the generated file
// import 'firebase_options.dart';

String? branchName ;

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
branchName=await CacheHelper.getStringFromCache(key: 'branch');
//  SystemChrome.setEnabledSystemUIMode(SystemUiMode., overlays: []);
SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp( ChocoApp());
   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child:  ChocoApp(),
    );
}

class ChocoApp extends StatefulWidget {

   ChocoApp({super.key});

  @override
  State<ChocoApp> createState() => _ChocoAppState();
}

class _ChocoAppState extends State<ChocoApp> {
  

  @override
  void initState() {
   debugPrint('branc : $branchName');
   
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: AppTheme.theme,
        home:branchName == null? LoginScreen():Home(branchName: branchName) 
      ),
    );
  }
}

