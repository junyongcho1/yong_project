import 'package:flutter/material.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_data.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_widget.dart';
import 'package:yong_project/pracscreen/draggable_example/utils.dart';

class DraggableAdvancedPage extends StatefulWidget {
  @override
  _DraggableAdvancedPageState createState() => _DraggableAdvancedPageState();
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  final List<Genders> all = allGenders;
  final List<Genders> male = [];
  final List<Genders> female = [];

  final double size = 150;

  void removeAll(Genders toRemove) {
    all.removeWhere((gender) => gender.imageUrl == toRemove.imageUrl);
    male.removeWhere((gender) => gender.imageUrl == toRemove.imageUrl);
    female.removeWhere((gender) => gender.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('advenced'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTarget(
              context,
              text: '성별',
              genders: all,
              acceptTypes: GenderType.values,
              onAccept: (data) => setState(() {
                removeAll(data);
                all.add(data);
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildTarget(
                  context,
                  text: '남성',
                  genders: male,
                  acceptTypes: [GenderType.male],
                  onAccept: (data) => setState(() {
                    removeAll(data);
                    male.add(data);
                  }),
                ),
                buildTarget(
                  context,
                  text: '여성',
                  genders: female,
                  acceptTypes: [GenderType.female],
                  onAccept: (data) => setState(() {
                    removeAll(data);
                    female.add(data);
                  }),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Genders> genders,
    required List<GenderType> acceptTypes,
    required DragTargetAccept<Genders> onAccept,
  }) =>
      CircleAvatar(
        radius: size / 2,
        child: DragTarget<Genders>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...genders
                  .map((gender) => DraggableWidget(gender: gender))
                  .toList(),
              IgnorePointer(child: Center(child: buildText(text))),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              Utils.showSnackBar(
                context,
                text: 'This Is Correct 🥳',
                color: Colors.green,
              );
            } else {
              Utils.showSnackBar(
                context,
                text: 'This Looks Wrong 🤔',
                color: Colors.red,
              );
            }

            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
