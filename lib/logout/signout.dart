import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yong_project/services/kakao_login.dart';
import 'package:yong_project/services/kakao_main_view.dart';

enum LoginPlatform { email, google, kakao }

class Signout {
  static LoginPlatform _loginPlatform = LoginPlatform.email;
  final viewModel = MAinViewModel(KakaoLoginUp());
  void signout() async {
    switch (_loginPlatform) {
      case LoginPlatform.google:
        await FirebaseAuth.instance.signOut();
        print('google 로그아웃');
        break;
      case LoginPlatform.kakao:
        await viewModel.logout();
        await FirebaseAuth.instance.signOut();
        print('kakao 로그아웃');
        break;
      case LoginPlatform.email:
        await FirebaseAuth.instance.signOut();
        print('email 로그아웃');
        break;
    }
    // setState(() {
    //   _loginPlatform = LoginPlatform.email;
    // });
  }

  static void setPlatform(LoginPlatform platform) {
    _loginPlatform = platform;
  }
}
