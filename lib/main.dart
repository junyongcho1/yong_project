import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:logger/logger.dart';
import 'package:yong_project/locations/location.dart';
import 'package:yong_project/page/login_screen.dart';
import 'package:yong_project/startpage.dart';
import 'firebase_options.dart';
import 'package:geolocator/geolocator.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kakao.KakaoSdk.init(nativeAppKey: '6e3c1dfbdc955e66d6cfb7a060e4be46');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NaverMapSdk.instance.initialize(
      clientId: '1wdhjlsvd1',
      onAuthFailed: (error) {
        print('Auth failed: $error');
      });
  //locations.getAddressFromCurrentLocation();
  runApp(const MyApp());
  requestLocationPermission();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

Future<void> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // 권한이 거부되었을 때 처리할 내용 작성
      return;
    }
  }
}
