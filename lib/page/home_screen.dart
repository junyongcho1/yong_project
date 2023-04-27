import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yong_project/logout/signout.dart';
import 'package:yong_project/services/google_service.dart';
import 'package:yong_project/services/kakao_login.dart';
import 'package:yong_project/services/kakao_main_view.dart';
import 'package:yong_project/startpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = MAinViewModel(KakaoLoginUp());
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
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(user.email!),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                //GoogleService().logout();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
                // signOut();
              },
              child: Text('로그아웃')),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                GoogleService().logout();
                //GoogleService().logout();
                //await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
                // signOut();
              },
              child: Text('google 로그아웃')),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                //GoogleService().logout();
                //await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
                // signOut();
              },
              child: Text('kakako 로그아웃')),
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
