import 'package:choco/core/images_path.dart';
import 'package:choco/data_source/local.dart';
import 'package:choco/screens/home/home.dart';
import 'package:choco/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? branchName ;

  @override
  void initState() {
    
    Future.delayed(const Duration(seconds: 2), () async{
      branchName=await CacheHelper.getStringFromCache(key: 'branch');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => branchName == null? const LoginScreen():Home(branchName: branchName) ,));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Image.asset(
          ImagePath.splash,
        ));
  }
}