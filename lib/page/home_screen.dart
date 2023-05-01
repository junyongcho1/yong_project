import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:yong_project/logout/signout.dart';
//import 'package:yong_project/page/new_screen.dart';
import 'package:yong_project/screen/first_screen.dart';
import 'package:yong_project/screen/second_screen.dart';
import 'package:yong_project/screen/thrid_screen.dart';
//import 'package:yong_project/services/google_service.dart';
// import 'package:yong_project/services/kakao_login.dart';
// import 'package:yong_project/services/kakao_main_view.dart';
import 'package:yong_project/startpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final viewModel = MAinViewModel(KakaoLoginUp());
  int currentIndex = 0;
  final screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    // Signout _signout = Signout();
    return Scaffold(
      body: screens[currentIndex],
      ////////////bottom navigation bar////////////////////
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 71, 233, 133),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            print(index);
            currentIndex = index;
          });
          // print(index);
          // switch (index) {
          //   case 0:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => HomeScreen()),
          //     // );
          //     break;
          //   case 1:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => NewScreen()),
          //     // );
          //     break;
          //   case 2:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => NewScreen()),
          //     // );
          //     break;
          // }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
