import 'package:cached_network_image/cached_network_image.dart';
import 'package:choco/core/images_path.dart';
import 'package:choco/models/item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeatilesImage extends StatelessWidget {
  ItemModel? chocoItem;
   DeatilesImage({Key? key,this.chocoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 300,
                          child: Hero(
                            transitionOnUserGestures:true ,
                            tag: chocoItem?.id??'',
                            child: ClipOval(
                              child: CachedNetworkImage(
                              imageUrl: chocoItem?.images ?? '',
                              placeholder: (context, url) => const CircleAvatar(
                                  backgroundImage: AssetImage(ImagePath.loading),
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
                      );
  }
}