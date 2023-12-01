import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:choco/core/images_path.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

// ignore: must_be_immutable
class DeatilesImage extends StatefulWidget {
   final List<String> imagesList;
    String? itemId;
   DeatilesImage({Key? key,required this.imagesList,required this.itemId}) : super(key: key);

  @override
  State<DeatilesImage> createState() => _DeatilesImageState();
}

class _DeatilesImageState extends State<DeatilesImage> {
   int currentImageIndex=0;

  @override
  Widget build(BuildContext context) {
         var responcive = ResponsiveBreakpoints.of(context);
    var width = MediaQuery.of(context).size.width;
    var hight= MediaQuery.of(context).size.height;
    // debugPrint('item Id : ${widget.itemId}');
    return Column(
      children: [
        SizedBox(
          child: CarouselSlider(
            options: CarouselOptions(
              height: responcive.isMobile? 310:450,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                currentImageIndex = index;
                setState(() {
                  
                });
              },
                animateToClosest: true,
                disableCenter: true,
              ),
            items: widget.imagesList.map((e) => Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: responcive.isMobile? 310:450,
                                    width: responcive.isMobile? 310:450,
                                  child: Hero(
                                    // transitionOnUserGestures:true ,
                                    tag:  e==widget.imagesList[0]? widget.itemId!:'',
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                      imageUrl: e ,
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
                                  )
                                  
                                ],
                              )).toList()
          ),
        ),
const SizedBox(height: 20,),
         DotsIndicator(
  dotsCount: widget.imagesList.length,
  position: currentImageIndex,
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
      ],
    );
  }
}