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
      appBar: AppBar(),
      body:  SingleChildScrollView(
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
                        Container(
                          height: MediaQuery.of(context).size.height*0.20,
                          width: MediaQuery.of(context).size.width*0.90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            
                          ),
                          child:  SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.20,
                                                      width: MediaQuery.of(context).size.width*0.85,
                                        child: Text(widget.chocoItem!.ingredients!,overflow: TextOverflow.visible,textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall?.copyWith())),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20,),
                         Text('Nutrition declaration per 100g',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13)),
                         const SizedBox(height: 20,),
                         
                         ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                          shrinkWrap: true,
  itemCount: nutritionColumn1.length,
  itemBuilder: (BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(nutritionColumn1[index]),
        SizedBox(width: 50,),
        Text(nutritionColumn2[index])],
    );
  },
),const SizedBox(height: 30,)
                  ],
        ),
      ),
    );
  }
}