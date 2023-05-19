import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yong_project/logout/signout.dart';
import 'package:yong_project/startpage.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Signout _signout = Signout();
    return Scaffold(
        body: Center(
          child: Text(
            'first_Home $counter',
            style: TextStyle(color: Colors.black),
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(
                  Alignment.bottomRight.x, Alignment.bottomRight.x - 0.2),
              child: FloatingActionButton(
                onPressed: incrementCounter,
                tooltip: '증가',
                child: Icon(Icons.add),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: decrementCounter,
                tooltip: '감소',
                child: Icon(Icons.remove),
              ),
            )
          ],
        ));
  }
}
