import 'package:category_navigator/category_navigator.dart';
import 'package:choco/core/colors.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/screens/home/widgets/item.dart';
import 'package:flutter/material.dart';

import '../../models/item_model.dart';

List<String>? keepOneInstance(List<String>? list) {
  final seenItems = <dynamic>{};

  final filteredList = list?.where((item) {
    final hasSeen = seenItems.contains(item);
    seenItems.add(item);
    return !hasSeen;
  }).toList();

  return filteredList??[];
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<String>? categoryList =  [];
  @override
  void initState() {
    // TODO: implement initState
    for (var element in DummyData.chocoList) { 
      var splitted= element.category?.split(',');
      categoryList?.addAll(splitted??[]);
    }
    categoryList= keepOneInstance(categoryList);
    DummyData.filteredChocoList = DummyData.chocoList
                    .where((element) => element.category!.contains(categoryList?[0]??''))
                    .toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    // Iterable<ItemModel> itemList=[];
    // var height =MediaQuery.of(context).size.height;
    
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.jpeg',fit: BoxFit.fill,)),
        body: LayoutBuilder(
  builder: (context, constraints) {
    var screenWidth = constraints.maxWidth;
    var itemsCount = (screenWidth / 190).floor();
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryNavigator(
            labels: categoryList,
            defaultActiveItem: 0,
            onChange: (index) {
              setState(() {
                DummyData.filteredChocoList = DummyData.chocoList
                    .where((element) => element.category!.contains(categoryList![index]))
                    .toList();
              });
            },
          ),
          const SizedBox(height: 20),
          DummyData.filteredChocoList.isNotEmpty? Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Item(chocoItem: DummyData.filteredChocoList[index]),
              itemCount: DummyData.filteredChocoList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: itemsCount,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
              ),
            ),
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.30,),
              const Center(child: Text('No Items For This Category !')),
            ],
          ),
        ],
      ),
    );
  },
));
  }
}
