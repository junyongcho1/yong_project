import 'package:flutter/material.dart';
import 'package:yong_project/widget/image_card_content.dart';

class OnlyCardSlider extends StatelessWidget {
  final Widget? title;

  final Color? cardColor;
  final double? height;
  final double? width;
  final Function? onTap;
  final ImageProvider imageProviders;
  final double borderRadius;
  final double? heightImage;
  final Widget? description;

  const OnlyCardSlider(
      {super.key,
      this.title,
      this.cardColor = Colors.white,
      this.onTap,
      this.height,
      this.width,
      this.borderRadius = 15,
      required this.imageProviders,
      this.heightImage,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.transparent,
      // width: width,
      // height: height,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(borderRadius),
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     color: Colors.grey.withOpacity(0.7),
      //   //     blurRadius: 5.0,
      //   //     spreadRadius: 0.0,
      //   //     offset: const Offset(0, 5),
      //   //   ),
      //   // ],
      //   //color: cardColor,
      // ),
      child: InkWell(
          onTap: () {
            onTap!();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
                child: Image(
                  image: imageProviders,
                  width: width,
                  height: heightImage,
                  fit: BoxFit.cover,
                ),
              ),
              // Container(
              //   height: height! * 0.5,
              //   decoration: BoxDecoration(color: Colors.amberAccent),
              //   child: ImageCardContent(
              //     title: title,
              //   ),
              // )
              ImageCardContent(
                title: title,
                description: description,
              )
              // Container(
              //     //padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              //     width: width!,
              //     height: height! * 0.5,
              //     decoration: BoxDecoration(color: Colors.amber),
              //     child: title)
            ],
          )),
    );
  }
}
