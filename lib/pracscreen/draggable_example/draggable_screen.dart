import 'package:flutter/material.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_appbar.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_data.dart';
import 'package:yong_project/pracscreen/draggable_example/draggable_widget.dart';
import 'package:yong_project/pracscreen/draggable_example/utils.dart';

class DraggableBasicPage extends StatefulWidget {
  @override
  _DraggableBasicPageState createState() => _DraggableBasicPageState();
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {
  final List<Genders> all = allGenders;
  int score = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(score: score),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildOrigin(),
              buildTargets(context),
            ],
          ),
        ),
      );

  Widget buildTargets(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTarget(
            context,
            text: '남성',
            acceptType: GenderType.male,
          ),
          buildTarget(
            context,
            text: '여성',
            acceptType: GenderType.female,
          ),
        ],
      );

  Widget buildOrigin() => Stack(
        alignment: Alignment.center,
        children: all.map((gender) => DraggableWidget(gender: gender)).toList(),
      );

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required GenderType acceptType,
  }) =>
      CircleAvatar(
        radius: 75,
        backgroundColor: Theme.of(context).primaryColor,
        child: DragTarget<Genders>(
          builder: (context, candidateData, rejectedData) => Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (data.type == acceptType) {
              Utils.showSnackBar(
                context,
                text: '정답입니다!🥳',
                color: Colors.green,
              );

              setState(() {
                score += 50;
                all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            } else {
              setState(() => score -= 20);

              Utils.showSnackBar(
                context,
                text: '다시 시도하세요!😥',
                color: Colors.red,
              );
            }
          },
        ),
      );
}
