import 'package:choco/core/dummy_data.dart';

List<String>? categoryList =  [];


//! Keep one item if item is found more than one time 
List<String>? keepOneInstance(List<String>? list) {
  final seenItems = <dynamic>{};

  final filteredList = list?.where((item) {
    final hasSeen = seenItems.contains(item);
    seenItems.add(item);
    return !hasSeen;
  }).toList();

  return filteredList??[];
}

// Handle Categories text to list using splittin by comma ','
void handleCategoryItemsList(){
  for (var element in DummyData.chocoList) {
          /*---> split the cat list <---*/
      var splitted= element.category?.split(',');
      categoryList?.addAll(splitted??[]);
    }
    categoryList= keepOneInstance(categoryList);

    //! initiat the first item in category list as default
    setSelectedCategory(categoryList?[0]??'');
}
/*Initiat the first item in category list as default*/
void setSelectedCategory(String? categoryTxt){
  DummyData.filteredChocoList = DummyData.chocoList
                    .where((element) => element.category!.contains(categoryTxt ??''))
                    .toList();
}