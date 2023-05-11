import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yong_project/logout/signout.dart';
import 'package:yong_project/startpage.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Signout _signout = Signout();
    return Scaffold(
        body: ListView(
      //padding: EdgeInsets.all(32),
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'MY',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            )),
        Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30),
          // ),
          //color: Color.fromARGB(255, 26, 25, 25),
          child: Stack(
            children: [
              Positioned(
                //left: 30,
                child: Container(
                  height: 250,
                  //width: 300,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.grey]),
                    //color: Color.fromARGB(255, 24, 23, 23),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color: Color.fromARGB(255, 24, 23, 23),
              //   ),
              // ),
              Positioned(
                  top: 20,
                  left: 35,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName! + ' 님',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            user.email!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  left: 300,
                  top: 200,
                  child: Container(
                    //color: Colors.amber,
                    child: InkWell(
                      onTap: () {
                        _signout.signout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartPage()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          Text('로그아웃', style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   width: 1,
                    // ),
                    InkWell(
                      onTap: () {
                        print('알림');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.notifications_none_outlined),
                            Text('알림')
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      //color: Colors.red,
                      thickness: 2.0,
                      indent: 30,
                      endIndent: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print('북마크');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.bookmark_border), Text('북마크')],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      //color: Colors.red,
                      thickness: 2.0,
                      indent: 30,
                      endIndent: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print('좋아요');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_outline,
                            ),
                            Text('좋아요')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    ));
  }
}
