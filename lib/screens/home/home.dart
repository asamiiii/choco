import 'package:choco/core/colors.dart';
import 'package:choco/screens/home/widgets/item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    
    return Scaffold(
        appBar: AppBar(
          
          title: Image.asset('assets/images/logo.jpeg')),
        body: DefaultTabController(
          length: 3,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var screenWidth = constraints.maxWidth;
              var itemsCount =  (screenWidth/190).floor();
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Column(
                children: [
                  const TabBar(tabs:[
                    Text('test 1'),
                    Text('test 1'),
                    Text('test 1'),
                  ] )
                  ,
                  // Container(
                  //   color: Colors.red,
                  //   height: height*0.05,
                  //   width: screenWidth,
                  //   child: ListView.separated(
                  //     scrollDirection:Axis.horizontal ,
                  //     itemBuilder: (context, index) => Column(
                  //       children: [
                  //         Text('test')
                  //       ],
                  //     ), separatorBuilder: (context, index) => const SizedBox(width: 10,), itemCount: 8),
                  // ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemBuilder:(context, index) => const Item(),
                        itemCount: 10,
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
          ),
        ));
  }
}
