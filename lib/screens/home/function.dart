// import 'package:choco/core/dummy_data.dart';
// import 'package:flutter/material.dart';

// List<String>? categoryList = [];
//  List<String> branches = [];

// //! Keep one item if item is found more than one time
// List<String>? keepOneInstance(List<String>? list) {
//   final seenItems = <dynamic>{};

//   final filteredList = list?.where((item) {
//     final hasSeen = seenItems.contains(item);
//     seenItems.add(item);
//     return !hasSeen;
//   }).toList();

//   return filteredList ?? [];
// }

// // Handle Categories text to list using splittin by comma ','
// void handleCategoryItemsList({String? branchName}) {
//   for (var element in DummyData.chocoList) {
//     /*---> split the cat list <---*/
//     var splitted = element.category?.split(',');
//     categoryList?.addAll(splitted ?? []);
//   }
//   categoryList = keepOneInstance(categoryList);

//   //! initiat the first item in category list as default
//   setSelectedCategory(categoryTxt: categoryList?[0] ?? '', branch: branchName);
// }

// void handleBranchesItemsList({String? branchName}) {
//   for (var element in DummyData.chocoList) {
//     /*---> split the cat list <---*/
//     var splitted = element.branch?.split(',');
//     branches.addAll(splitted ?? []);
//   }
//   branches = keepOneInstance(branches)??[];

//   //! initiat the first item in category list as default
//   if(categoryList!.isNotEmpty){
//     debugPrint('categoryList NotEmpty');
//    setSelectedCategory(categoryTxt: categoryList?[0] ?? '', branch: branchName);
//   }
  
// }


// /*Initiat the first item in category list as default*/
// void setSelectedCategory({String? categoryTxt, String? branch}) {
//   debugPrint('branch:$branch');
//   DummyData.filteredChocoList = DummyData.chocoList.where((element) {
//     return element.category!.contains(categoryTxt ?? '') &&
//         element.branch!.contains(branch??'');
//   }).toList();
// }
