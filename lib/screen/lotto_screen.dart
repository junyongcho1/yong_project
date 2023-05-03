import 'dart:math';
import 'package:flutter/material.dart';

class LottoScreen extends StatefulWidget {
  const LottoScreen({super.key});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  List<List<int>> list_lotto = [];
  void _randomCounter() {
    setState(() {
      List<int> lotto = [];
      while (true) {
        var rnd = Random().nextInt(45) + 1;
        if (!lotto.contains(rnd)) {
          lotto.add(rnd);
        }
        if (lotto.length == 6) break;
      }
      lotto.sort();
      list_lotto.add(lotto);
    });
  }

  void _Clear() {
    setState(() {
      list_lotto.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: list_lotto.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 16),
              child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        index.toString(),
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(list_lotto[index].toString())
                    ],
                  )),
            );
            // return Container(
            //   child: Text(list_lotto[index].toString()),
            // );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x, Alignment.bottomRight.x - 0.2),
            child: FloatingActionButton(
              onPressed: _randomCounter,
              tooltip: '증가',
              child: Icon(Icons.add),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _Clear,
              tooltip: '증가',
              child: Icon(Icons.refresh),
            ),
          )
        ],
      ),
    );
  }
}
