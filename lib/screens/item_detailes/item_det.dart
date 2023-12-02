import 'package:choco/core/colors.dart';
import 'package:choco/models/item_model.dart';
import 'package:choco/screens/item_detailes/widgets.dart/image_datails.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

// ignore: must_be_immutable
class ChocoDetailes extends StatefulWidget {
   ItemModel? chocoItem;
   ChocoDetailes({super.key,this.chocoItem});

  @override
  State<ChocoDetailes> createState() => _ChocoDetailesState();
}

class _ChocoDetailesState extends State<ChocoDetailes> {
  List<String>imagesList=[];
  var nutritionColumn1=[];
     var nutritionColumn2=[];

  @override
  void initState() {
    var nutritionRow = widget.chocoItem?.nutritionDeclaration?.trim().split('-')??[]; 
     
     for (var element in nutritionRow) { 
      List<String>? splitted= element.trim().split(':');
      // if(splitted.length>2){
      nutritionColumn1.add(splitted[0].trim());
      nutritionColumn2.add(splitted[1].trim());
     }
      // nutritionRow = widget.chocoItem?.nutritionDeclaration?.split(':'); 
     debugPrint('nutritionColumn1 : $nutritionColumn1');
     debugPrint('nutritionColumn2 :${nutritionColumn2.length}');

      widget.chocoItem?.imagesList?.trim().split(',').forEach((element) { 
        imagesList.add(element);
      });
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
     var responcive = ResponsiveBreakpoints.of(context);
    return Scaffold(
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      },child:const Icon(Icons.arrow_back ), ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
                    children: [
                       DeatilesImage(itemId: widget.chocoItem?.id,imagesList: imagesList),
                       const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Text(widget.chocoItem?.name??'',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              ))
                          ],),
                          const SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.70,
                              // height: 50,
                              child: SingleChildScrollView(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  widget.chocoItem?.discription??'',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),maxLines: 4,overflow: TextOverflow.ellipsis,),
                              ))
                          ],),
                          const SizedBox(height: 10,),
                           Text('Ingredienser',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:responcive.isMobile?  15:20),),
                          const SizedBox(height: 5,),
                          Container(
                              // height: MediaQuery.of(context).size.height*0.20,
                              width: MediaQuery.of(context).size.width*0.90,
                              decoration: BoxDecoration(
                                color: golden,
                                border: Border.all(color: Colors.brown,width: 2),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  // bottomLeft: Radius.circular(23),
                                  bottomRight: Radius.circular(40),
                                )
                                
                              ),
                              child:  Padding(
                  padding: const EdgeInsets.all(9),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.chocoItem!.ingredients!,
                      textAlign: TextAlign.center,
                      style: responcive.isMobile? Theme.of(context).textTheme.bodySmall:Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 17),
                    ),
                  ),
                ),
                            ),
                          
      
                          const SizedBox(height: 20,),
                           Text('Näringdeklaration per 100g',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:responcive.isMobile? 13:17)),
                           const SizedBox(height: 20,),
                           
                           ListView.builder(
                            // separatorBuilder: (context, index) => const SizedBox(height: 10,),
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                           itemCount: nutritionColumn2.length,
                           itemBuilder: (BuildContext context, int index) {
                             return Center(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                  const Expanded(child: SizedBox()),
                                   Container(
                                    color: index.isOdd?golden:null,
                                    width: MediaQuery.of(context).size.width*0.30,child: Text(nutritionColumn1[index],style:Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: responcive.isMobile?15:18)),),
                                  const SizedBox(width: 10,), 
                                   Container(
                                    color: index.isOdd?golden:null,
                                    width: MediaQuery.of(context).size.width*0.13,child: Text(nutritionColumn2[index],style:Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: responcive.isMobile?15:18)),),
                                   const Expanded(child: SizedBox()),
                                   ],
                                   
                               ),
                             );
                           },
                             ),
                           
                           const SizedBox(height: 30,)
                    ],
          ),
        ),
      ),
    );
  }
}