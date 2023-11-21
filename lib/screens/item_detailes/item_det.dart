import 'package:cached_network_image/cached_network_image.dart';
import 'package:choco/models/item_model.dart';
import 'package:flutter/material.dart';

class ChocoDetailes extends StatefulWidget {
  ItemModel? chocoItem;
   ChocoDetailes({super.key,this.chocoItem});

  @override
  State<ChocoDetailes> createState() => _ChocoDetailesState();
}

class _ChocoDetailesState extends State<ChocoDetailes> {
 
  @override
  Widget build(BuildContext context) {
     var nutritionRow = widget.chocoItem?.nutritionDeclaration?.split('-'); 
     var nutritionColumn1=[];
     var nutritionColumn2=[];
     nutritionRow?.forEach((element) { 
      var splitted= element.split(':');
      nutritionColumn1.add(splitted[0].trim());
      nutritionColumn2.add(splitted[1].trim());
     });
      // nutritionRow = widget.chocoItem?.nutritionDeclaration?.split(':'); 
     debugPrint('nutritionColumn1 : $nutritionColumn1');
     debugPrint('nutritionColumn2 :$nutritionColumn2');
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
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 300,
                          child: Hero(
                            transitionOnUserGestures:true ,
                            tag: widget.chocoItem?.id??'',
                            child: ClipOval(
                              child: CachedNetworkImage(
                              imageUrl: widget.chocoItem?.images ?? '',
                              placeholder: (context, url) => const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/loading.webp'),
                                  radius: 100),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: 140, // Adjust the size as needed
                              height: 140,
                                            ),
                            ),
                          ),
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(widget.chocoItem?.name??'',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),)
                          ],),
                          const SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width-100,
                              height: 50,
                              child: Text(
                                
                                widget.chocoItem?.discription??'',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),maxLines: 3,overflow: TextOverflow.ellipsis,))
                          ],),
                          const SizedBox(height: 20,),
                           Text('Ingredients',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15),),
                          const SizedBox(height: 5,),
                          LayoutBuilder(
                            builder: (context, constraints) =>Container(
                              // height: MediaQuery.of(context).size.height*0.20,
                              width: MediaQuery.of(context).size.width*0.90,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  // topRight: Radius.circular(50),
                                  // bottomLeft: Radius.circular(23),
                                  // bottomRight: Radius.circular(50),
                                )
                                
                              ),
                              child:  Padding(
                  padding: const EdgeInsets.all(9),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.chocoItem!.ingredients!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                  ),
                ),
                            ),
                          ),
      
                          const SizedBox(height: 20,),
                           Text('Nutrition declaration per 100g',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13)),
                           const SizedBox(height: 5,),
                           
                           LayoutBuilder(
                             builder:(context, constraints) =>  Container(
                              width: MediaQuery.of(context).size.width*0.50,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                border: Border.all(color: Colors.amberAccent),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),)
                              ),
                               child: ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                shrinkWrap: true,
                               itemCount: nutritionColumn1.length,
                               itemBuilder: (BuildContext context, int index) {
                                 return Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(nutritionColumn1[index]),
                                     const SizedBox(width: 50,),
                                     Text(nutritionColumn2[index])],
                                 );
                               },
                             ),
                             ),
                           ),const SizedBox(height: 30,)
                    ],
          ),
        ),
      ),
    );
  }
}