import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:yong_project/logout/signout.dart';
import 'package:yong_project/server/firebase_auth_remote_data_source.dart';
import 'package:yong_project/services/kakao_service.dart';

class MAinViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final KakaoLogin _kakaoLogin;
  bool isLogined = false;
  kakao.User? user;

  MAinViewModel(this._kakaoLogin);

  Future login() async {
    isLogined = await _kakaoLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
        'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
      });
      await FirebaseAuth.instance.signInWithCustomToken(token);
      print('$user');
      //여기있다 로그인 찾아라!!!!!!!!!!!!!!!!!!!!!!!!11
      Signout.setPlatform(LoginPlatform.kakao);
    }
  }

  Future logout() async {
    await _kakaoLogin.logout();
    isLogined = false;
    user = null;
  }
}
