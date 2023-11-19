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
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
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
                        Text(widget.chocoItem?.name??'',style: Theme.of(context).textTheme.bodyLarge,)
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
                      ],)
                ],
      ),
    );
  }
}