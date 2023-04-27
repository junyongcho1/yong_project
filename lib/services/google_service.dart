import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yong_project/logout/signout.dart';

// class GoogleService {
//   //LoginPlatform? _loginPlatform;
//   signInWithGoolge() async {
//     try {
//       //구글 Sign in 플로우 오픈!
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final String userEmail = googleUser!.email;
//       final String? userName = googleUser.displayName;
//       final String? userPhotoUrl = googleUser.photoUrl;

//       //구글 인증 정보 읽어왓!
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser.authentication;

//       //읽어온 인증정보로 파이어베이스 인증 로그인!
//       final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//       print('${FirebaseAuth.instance.currentUser}');
//       print('$credential');
//       print('User email: $userEmail');
//       print('User name: $userName');
//       print('User photo URL: $userPhotoUrl');
//       // setState(() {
//       //   _loginPlatform = LoginPlatform.google;
//       // });
//       //파이어 베이스 Signin하고 결과(userCredential) 리턴햇!
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future logout() async {
//     await GoogleSignIn().signOut();
//     //await GoogleSignIn().disconnect();
//   }
// }
class GoogleService {
  GoogleSignInAccount? _googleUser;
  GoogleSignIn googleSignIn = GoogleSignIn();

  signInWithGoolge() async {
    try {
      //구글 Sign in 플로우 오픈!
      _googleUser = await googleSignIn.signIn();
      final String userEmail = _googleUser!.email;
      final String? userName = _googleUser!.displayName;
      final String? userPhotoUrl = _googleUser!.photoUrl;

      //구글 인증 정보 읽어왓!
      final GoogleSignInAuthentication? googleAuth =
          await _googleUser!.authentication;

      //읽어온 인증정보로 파이어베이스 인증 로그인!
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      print('${FirebaseAuth.instance.currentUser}');
      print('$credential');
      print('User email: $userEmail');
      print('User name: $userName');
      print('User photo URL: $userPhotoUrl');

      //파이어 베이스 Signin하고 결과(userCredential) 리턴햇!
      //return await FirebaseAuth.instance.signInWithCredential(credential);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      //여기있다 로그인 찾아라!!!!!!!!!!!!!!!!!!!!!!!!11
      Signout.setPlatform(LoginPlatform.google);
      return userCredential;
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    try {
      await googleSignIn.signOut();
      //await GoogleSignIn().signOut();
      //await GoogleSignIn().disconnect();
      _googleUser = null;
    } catch (e) {
      print(e.toString());
    }
  }
}
