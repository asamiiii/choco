import 'package:category_navigator/category_navigator.dart';
import 'package:choco/core/colors.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/screens/home/widgets/item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemsList = const ['All', 'Android', 'ML', 'Python', 'Flutter', 'Text', 'iOS', 'Web', 'Windows'];
    
    // var height =MediaQuery.of(context).size.height;
    
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.jpeg',fit: BoxFit.fill,)),
        body: LayoutBuilder(
          builder: (context, constraints) {
            var screenWidth = constraints.maxWidth;
            var itemsCount =  (screenWidth/190).floor();
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              children: [
                CategoryNavigator(
                  labels: itemsList,
                  onChange: (p0) {
                  
                },),
                const SizedBox(height: 20,),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemBuilder:(context, index) =>  Item(chocoItem:DummyData.chocoList[index] ),
                      itemCount: DummyData.chocoList.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: itemsCount,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10
                      ),
                  ),
                ),
              ],
            ),
          );}
        ));
  }
}
