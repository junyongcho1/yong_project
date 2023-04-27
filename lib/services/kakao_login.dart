import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:yong_project/services/kakao_service.dart';

class KakaoLoginUp implements KakaoLogin {
  //User? user;
  @override
  Future<bool> login() async {
    //user = await UserApi.instance.me();
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공');
          print('$UserApi');
          return true;
        } catch (e) {
          print('카카오톡으로 로그인 실패 $e');
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          print('$UserApi');
          return true;
        } catch (e) {
          print('카카오계정으로 로그인 실패 $e');
          return false;
        }
      }
    } catch (e) {
      print('카카오 뭔가 잘못됨 $e');
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('카카오 로그아웃 성공');
      return true;
    } catch (error) {
      print('카카오 로그아웃 실패 $error');
      return false;
    }
  }
}
