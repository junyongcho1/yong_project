import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yong_project/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:yong_project/components/my_button.dart';
import 'package:yong_project/components/my_textfield.dart';
import 'package:yong_project/components/square_tile.dart';

// class Signup extends StatelessWidget {
//   Signup({super.key});

//   // text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final displayNameController = TextEditingController();
//   final ageController = TextEditingController();
//   final addressController = TextEditingController();
//   final phoneNumberController = TextEditingController();

//   Future<void> _createUser() async {
//     try {
//       //유저 email,password로 만들기
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: emailController.text, password: passwordController.text);
//       //firestore에 회원정보 저장
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'displayName': displayNameController.text,
//         'age': ageController.text,
//         'address': addressController.text,
//         'phoneNumber': phoneNumberController.text,
//       });
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       //Navigator.of(context).pushReplacementNamed('/home');
//     } on FirebaseAuthException catch (e) {
//       //생성 실패하면 에러 보여줘
//       if (e.code == 'weak-password') {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Registration Failed'),
//             content: Text('The password provided is too weak.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       } else if (e.code == 'email-already-in-use') {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Registration Failed'),
//             content: Text('The account already exists for that email.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   double _sigmaX = 5; // from 0-10
//   double _sigmaY = 5; // from 0-10
//   double _opacity = 0.2;
//   double _width = 350;
//   double _height = 300;
//   final _formKey = GlobalKey<FormState>();

//   // sign user in method
//   void signUserIn() {
//     if (_formKey.currentState!.validate()) {
//       print('valid');
//     } else {
//       print('not valid');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Image(
//                 image: AssetImage('assets/lennini.jpg'),
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 fit: BoxFit.cover,
//               ),
//               // Image.network(
//               //   'https://anmg-production.anmg.xyz/yaza-co-za_sfja9J2vLAtVaGdUPdH5y7gA',
//               //   width: MediaQuery.of(context).size.width,
//               //   height: MediaQuery.of(context).size.height,
//               //   fit: BoxFit.cover,
//               // ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back_ios),
//                     color: Colors.white,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.26),
//                   const Text("회원가입",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                   ClipRect(
//                     child: BackdropFilter(
//                       filter:
//                           ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(0, 0, 0, 1)
//                                 .withOpacity(_opacity),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(30))),
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         height: MediaQuery.of(context).size.height * 0.49,
//                         child: Form(
//                           key: _formKey,
//                           child: Center(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 const Text("계정이 없습니다. 새로운 계정을 생성 하세요",
//                                     // ignore: prefer_const_constructors
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                     textAlign: TextAlign.start),
//                                 // ignore: prefer_const_constructors
//                                 const Text(
//                                   "예) yeonji@gmail.com",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 const SizedBox(height: 30),

//                                 MyTextField(
//                                   controller: emailController,
//                                   hintText: 'Email',
//                                   obscureText: false,
//                                 ),

//                                 const SizedBox(height: 10),
//                                 MyPasswordTextField(
//                                   controller: passwordController,
//                                   hintText: 'Password',
//                                   obscureText: true,
//                                 ),
//                                 const SizedBox(height: 30),

//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     RichText(
//                                       text: const TextSpan(
//                                         text: '',
//                                         children: <TextSpan>[
//                                           TextSpan(
//                                             text: '서비스 약관 및 개인 정보 보호 정책 ',
//                                             style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 71, 233, 133),
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20),
//                                           ),
//                                           TextSpan(
//                                               text:
//                                                   '아래에서 동의 및 계속을 선택하면 다음 내용에 동의합니다.',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20)),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     MyButtonAgree(
//                                       text: "동의하고 계속하기",
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     LoginScreen()));
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }

  _SignupState createstate() => _SignupState();
  //Signup({super.key});
}

class _SignupState extends State<Signup> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final displayNameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Future<void> _createUser() async {
    try {
      //유저 email,password로 만들기
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      //firestore에 회원정보 저장
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': emailController.text,
        'displayName': displayNameController.text,
        'age': ageController.text,
        'address': addressController.text,
        'phoneNumber': phoneNumberController.text,
      });
      await FirebaseAuth.instance.currentUser!
          .updateProfile(displayName: displayNameController.text);
      //await FirebaseAuth.instance.currentUser!.updatePhoneNumber(phoneNumberController.text,);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      //생성 실패하면 에러 보여줘
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('회원가입 실패'),
            content: Text('비밀번호를 다시 입력하세요'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('회원가입 실패'),
            content: Text('중복된 이메일입니다, 다시 입력하세요.'),
            actions: <Widget>[
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

// sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
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
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height * 0.26),
                  const Text("회원가입",
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
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: ListView(
                              // mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("계정이 없습니다. 새로운 계정을 생성 하세요",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.start),
                                // ignore: prefer_const_constructors
                                const Text(
                                  "예) yeonji@gmail.com",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 30),

                                MydisplayNameTextField(
                                  controller: displayNameController,
                                  hintText: 'Name',
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
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
                                MyphoneNumerTextField(
                                  controller: phoneNumberController,
                                  hintText: 'Phone Number',
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                MyaddressTextField(
                                  controller: addressController,
                                  hintText: 'Address',
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                MyageTextField(
                                  controller: ageController,
                                  hintText: 'Age',
                                  obscureText: false,
                                ),

                                const SizedBox(height: 30),

                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '서비스 약관 및 개인 정보 보호 정책 ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                              text:
                                                  '아래에서 동의 및 계속을 선택하면 다음 내용에 동의합니다.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    MyButtonAgree(
                                      text: "동의하고 계속하기",
                                      onTap: () {
                                        _createUser();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             LoginScreen()));
                                      },
                                    ),
                                  ],
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
