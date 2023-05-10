import 'package:flutter/material.dart';
import 'package:yong_project/widget/image_card_content.dart';

class CardSlider extends StatelessWidget {
  final Widget? title;
  final String? subtitle;
  final Color? cardColor;
  final double? height;
  final double? width;
  final Function? onTap;
  final ImageProvider imageProvider;
  final double borderRadius;
  final double? heightImage;
  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final Widget? description;
  final double? tagRunSpacing;
  final double? tagSpacing;
  final Widget? footer;

  const CardSlider({
    super.key,
    this.title,
    this.subtitle,
    this.cardColor = Colors.white,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius = 15,
    required this.imageProvider,
    this.heightImage,
    this.contentPadding,
    this.tags,
    this.description,
    this.footer,
    this.tagRunSpacing,
    this.tagSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.transparent,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 5),
          ),
        ],
        color: cardColor,
      ),
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
                ),
                child: Image(
                  image: imageProvider,
                  width: width,
                  height: heightImage,
                  fit: BoxFit.cover,
                ),
              ),
              ImageCardContent(
                contentPadding: contentPadding,
                tags: tags,
                title: title,
                footer: footer,
                description: description,
                tagSpacing: tagSpacing,
                tagRunSpacing: tagRunSpacing,
              )
            ],
          )),
    );
  }
}
