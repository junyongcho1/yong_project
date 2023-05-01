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
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Signout _signout = Signout();
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('로그인 됨'),
          SizedBox(
            height: 8,
          ),
          // CircleAvatar(
          //   radius: 40,
          //   backgroundImage: NetworkImage(user.photoURL!),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          // Text(
          //   '이름: ' + user.displayName!,
          //   style: TextStyle(color: Colors.white, fontSize: 16),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          Text(
            '이메일: ' + user.email!,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            '이름: ' + user.displayName!,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),

          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                _signout.signout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
                // signOut();
              },
              child: Text('real 로그아웃!!'))
        ],
      ),
    ));
  }
}
