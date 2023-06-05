import 'package:flutter/material.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_data.dart';

class DraggableWidget extends StatelessWidget {
  final Genders gender;

  const DraggableWidget({
    Key? key,
    required this.gender,
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<Genders>(
        data: gender,
        feedback: buildImage(),
        child: buildImage(),
        childWhenDragging: Container(height: size),
      );

  Widget buildImage() => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Image.asset(gender.imageUrl),
      );
}
