import 'package:category_navigator/category_navigator.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/core/images_path.dart';
import 'package:choco/screens/home/function.dart';
import 'package:choco/screens/home/widgets/item.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  String? branchName;
   Home({super.key,this.branchName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    
  @override
  void initState() {
    //? Intial Category
    handleCategoryItemsList(branchName: widget.branchName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(ImagePath.logo,fit: BoxFit.fill,)),
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
              setSelectedCategory(categoryTxt: categoryList![index],branch: widget.branchName);
              setState(() {});
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
