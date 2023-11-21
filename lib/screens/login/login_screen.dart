import 'package:choco/core/colors.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/core/images_path.dart';
import 'package:choco/screens/home/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

TextEditingController codeController = TextEditingController();
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
                if(DummyData.branches.contains(codeController.text.trim())){
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