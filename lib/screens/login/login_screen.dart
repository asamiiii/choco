import 'package:choco/core/colors.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/core/images_path.dart';
import 'package:choco/data_source/remote_firebase.dart';
import 'package:choco/screens/home/function.dart';
import 'package:choco/screens/home/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
TextEditingController codeController = TextEditingController();


@override
  void initState() {
   
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      await FirebaseHelper.getItemsFromFirestore();
    handleBranchesItemsList();
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    return   Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // child: const Text('Login Login')
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHight*0.30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(ImagePath.logo,width:screenWidth*0.60 ,),
               ],
             ),
             const SizedBox(height: 30,),
             SizedBox(
              width: screenWidth*0.75,
               child:  TextFormField(
                controller: codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a branch code',
                ),
                       ),
             ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                if(branches.contains(codeController.text.trim())){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Home(branchName:codeController.text.trim()),));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Center(child: Text("Login failed"))));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(golden)
              ), 
              child:  Text('Login',style:Theme.of(context).textTheme.bodySmall ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}