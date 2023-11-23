import 'package:carousel_slider/carousel_slider.dart';
import 'package:category_navigator/category_navigator.dart';
import 'package:choco/core/dummy_data.dart';
import 'package:choco/core/images_path.dart';
import 'package:choco/data_source/remote_firebase.dart';
import 'package:choco/main.dart';
import 'package:choco/providers.dart/provider.dart';
import 'package:choco/screens/home/function.dart';
import 'package:choco/screens/home/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  String? branchName;
  Home({super.key, this.branchName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // FirebaseHelper.getItemsFromFirestore();
    //? Intial Category
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<MainProvider>()
          .getItems();

          context
          .read<MainProvider>().handleCategoryItemsList();
                  context
          .read<MainProvider>().setSelectedCategory(branch:branchName,categoryTxt: context
          .read<MainProvider>().categoryList?[0] );
          await context
          .read<MainProvider>().getAnnouncment();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async{
        await context.read<MainProvider>().getItems();
        setState(() {
          
        });
        
      },
      child: Scaffold(
        bottomNavigationBar: Consumer<MainProvider>(
          builder: (context, value, child) => value.isLoading==false? SizedBox(
            height: 50,
            child: CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                
              ),
              items: value.announcmentList.map((e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                                    height: 40,
                                    width: MediaQuery.of(context).size.width*0.95,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                    child:  Text(e.txt??'',style: const TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                                  ),
                                  // const SizedBox(height: 25,)
                ],
              ),).toList(),
              
            ),
          ):const Center(child: CircularProgressIndicator()),
        ),
          body: Consumer<MainProvider>(
        builder: (context, provider, child) => provider.isLoading == false
            ? LayoutBuilder(
                builder: (context, constraints) {
                  var screenWidth = constraints.maxWidth;
                  var itemsCount = (screenWidth / 190).floor();
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          ImagePath.logo,
                          fit: BoxFit.fill,
                          height: 50,
                          width: 350,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        
                        const SizedBox(height: 5,),
                        CategoryNavigator(
                          labels: provider.categoryList,
                          defaultActiveItem: 0,
                          onChange: (index) {
                            provider.setSelectedCategory(
                                categoryTxt: provider.categoryList![index],
                                branch: widget.branchName);
                            debugPrint('${DummyData.filteredChocoList}');
                            // setState(() {});
                          },
                        ),
                        
                        DummyData.filteredChocoList.isNotEmpty
                            ? Expanded(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Item(
                                      chocoItem:
                                          DummyData.filteredChocoList[index]),
                                  itemCount: DummyData.filteredChocoList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: itemsCount,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 10,
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                  ),
                                  const Center(
                                      child:
                                          Text('No Items For This Category !')),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      )),
    );
  }
}
