import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key});

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
                        bottomRight:Radius.circular(40) 
                        ),
                      child: Container(
                        color: Colors.amber,
                        height: 220,
                        width: 190,
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      left: 14,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/R.jpg'),
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
                              'Text Chocoo',
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
                              'Text Chocoooo',
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