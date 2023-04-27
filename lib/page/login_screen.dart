import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yong_project/components/my_button.dart';
import 'package:yong_project/components/my_textfield.dart';
import 'package:yong_project/components/square_tile.dart';
import 'package:yong_project/logout/signout.dart';
import 'package:yong_project/main.dart';
import 'package:yong_project/page/home_screen.dart';
import 'package:yong_project/page/signup.dart';
import 'package:yong_project/services/google_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yong_project/services/kakao_login.dart';
import 'package:yong_project/services/kakao_main_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void signUserIn() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     if (credential.user != null) {
  //       print('${emailController.text},${passwordController.text}');
  //       print('${FirebaseAuth.instance.currentUser}');
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen()),
  //       );
  //     }else{}
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //     //showErrorMessage(e.code);
  //   }
  // }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  //kakao 객체
  final viewModel = MAinViewModel(KakaoLoginUp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Image.asset(
              //   'assets/lennini.jpg',
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   fit: BoxFit.cover,
              // ),
              Image(
                image: AssetImage('assets/lennini.jpg'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              // Image.network(
              //   'https://anmg-production.anmg.xyz/yaza-co-za_sfja9J2vLAtVaGdUPdH5y7gA',
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   fit: BoxFit.cover,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  // IconButton(
                  //   icon: const Icon(Icons.arrow_back_ios),
                  //   color: Colors.white,
                  //   onPressed: () {},
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                  const Text("안녕하세요 !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: ListView(
                              //mainAxisSize: MainAxisSize.min,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // username textfield
                                MyTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                MyPasswordTextField(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),

                                const SizedBox(height: 10),

                                // 로그인 button
                                MyButton(
                                  onTap: (() async {
                                    if (_formKey.currentState!.validate()) {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: ((context) => Center(
                                              child:
                                                  CircularProgressIndicator())));
                                      try {
                                        final credential = await FirebaseAuth
                                            .instance
                                            .signInWithEmailAndPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                        if (credential.user != null) {
                                          print(
                                              '${emailController.text},${passwordController.text}');
                                          print(
                                              '${FirebaseAuth.instance.currentUser}');
                                          //여기있다 로그인 찾아라!!!!!!!!!!!!!!!!!!!!!!!!11
                                          Signout.setPlatform(
                                              LoginPlatform.email);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
                                        } else {}
                                      } on FirebaseAuthException catch (e) {
                                        logger.e(e);
                                        String message = '';
                                        if (e.code == 'user-not-found') {
                                          message = '사용자가 존재하지 않습니다.';
                                        } else if (e.code == 'wrong-password') {
                                          message = '비밀번호를 확인하세요';
                                        } else if (e.code == 'invalid-email') {
                                          message = '이메일을 확인하세요.';
                                        }
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          //BackdropFilter(filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),),
                                          SnackBar(
                                            content: Text(message),
                                            backgroundColor:
                                                Color.fromRGBO(0, 0, 0, 1)
                                                    .withOpacity(0.5),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      }
                                    } else {
                                      print('정보 부족!.');
                                    }
                                  }),
                                ),

                                const SizedBox(height: 10),

                                // or
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // 소셜 로그인
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // kakao button
                                      SquareTile(
                                          onTap: () async {
                                            await viewModel.login();
                                            print('kakao');
                                          },
                                          imagePath: 'assets/kakao.png',
                                          title: "Kakao  로그인"),
                                      SizedBox(height: 10),

                                      // google button
                                      SquareTile(
                                        onTap: () {
                                          GoogleService().signInWithGoolge();
                                          print('google');
                                        },
                                        imagePath: 'assets/google.png',
                                        title: "Google 로그인",
                                      ),

                                      SizedBox(height: 10),

                                      // naver button
                                      SquareTile(
                                          onTap: () {
                                            print('naver');
                                          },
                                          imagePath: 'assets/naver.png',
                                          title: "Naver  로그인"),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              await viewModel.logout();
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           Signup()),
                                              // );
                                            },
                                            style: TextButton.styleFrom(
                                              //minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              //tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            child: Text(
                                              '비밀번호 찾기',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Signup()),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              //minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              //tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            child: Text(
                                              '회원가입',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
