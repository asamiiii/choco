import 'package:choco/models/item_model.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
   ItemModel? chocoItem;
   Item({super.key,required this.chocoItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft:Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomRight:Radius.circular(40),
                         topLeft:Radius.circular(10)
                        ),
                      child: Container(
                        color: Colors.amber,
                        height: 220,
                        width: 190,
                      ),
                    ),
                  ),
                   Positioned(
                      top: 0,
                      left: 14,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(chocoItem?.images??''),
                        radius: 75,
                      )),
                  Positioned(
                      top:160 ,
                      left: 20,
                      // right: 20,
                      child: Column(
                        children: [
                          
                          SizedBox(
                            width: 160,
                            height: 30,
                            child: Text(
                              chocoItem?.name??'',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 140,
                            height: 50,
                            child: Text(
                              chocoItem?.discription??'',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ))
                ],
              );
  }
}