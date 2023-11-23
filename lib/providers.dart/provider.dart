import 'package:choco/core/dummy_data.dart';
import 'package:choco/data_source/remote_firebase.dart';
import 'package:choco/models/announ_model.dart';
import 'package:flutter/foundation.dart';

class MainProvider extends ChangeNotifier{
  bool isLoading=false;
   List<String>? categoryList = [];
 List<String> branches = [];
 List<Announcment> announcmentList=[];

  getItems()async{
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getItemsFromFirestore();
    isLoading=false;
    notifyListeners();
  }

 

//! Keep one item if item is found more than one time
List<String>? keepOneInstance(List<String>? list) {
  final seenItems = <dynamic>{};

  final filteredList = list?.where((item) {
    final hasSeen = seenItems.contains(item);
    seenItems.add(item);
    return !hasSeen;
  }).toList();

  return filteredList ?? [];
}

// Handle Categories text to list using splittin by comma ','
void handleCategoryItemsList() {
  for (var element in DummyData.chocoList) {
    /*---> split the cat list <---*/
    var splitted = element.category?.split(',');
    categoryList?.addAll(splitted ?? []);
  }
  categoryList = keepOneInstance(categoryList);

  //! initiat the first item in category list as default

}

void handleBranchesItemsList() {
  for (var element in DummyData.chocoList) {
    /*---> split the cat list <---*/
    var splitted = element.branch?.split(',');
    branches.addAll(splitted ?? []);
  }
  branches = keepOneInstance(branches)??[];

  //! initiat the first item in category list as default
  
  
}


/*Initiat the first item in category list as default*/
void setSelectedCategory({String? categoryTxt, String? branch}) {
  debugPrint('branch:$branch');
  DummyData.filteredChocoList = DummyData.chocoList.where((element) {
    return element.category!.contains(categoryTxt ?? '') &&
        element.branch!.contains(branch??'');
  }).toList();
  notifyListeners();
}

 getAnnouncment()async{
isLoading = true;
    notifyListeners();
    await FirebaseHelper.getAnnouncmentFromFirestore();
    for (var element in DummyData.announcments) {
      announcmentList.add(element);
     }
    isLoading=false;
    notifyListeners();
}
}