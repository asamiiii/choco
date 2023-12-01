import 'package:choco/core/theme.dart';
import 'package:choco/firebase_options.dart';
import 'package:choco/providers.dart/provider.dart';
import 'package:choco/screens/home/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
// Import the generated file
// import 'firebase_options.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

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
  //  debugPrint('branc : $branchName');
   
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
        builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
        home:const SplashScreen()
      ),
    );
  }
}

