import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:yong_project/locations/global_controller.dart';
import 'package:yong_project/page/home_screen.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late NaverMapController _mapController;
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  double lat = 0;
  double lon = 0;

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  void GlobalController2() async {
    await globalController.getLocation();
    getAddress();
  }

  Future<void> getAddress() async {
    try {
      //Future<void>
      // 현재 위치 가져오기
      //Position currentPosition = await locations.getCurrentLocation();
      // 현재 위치의 위도와 경도 값을 추출
      double latitude = globalController.getLatitude().value;
      double longitude = globalController.getLongitude().value;

      setState(() {
        lat = latitude;
        lon = longitude;
      });

      print('네이버 위도+${globalController.getLatitude().value}');
      print('네이버 경도+${globalController.getLongitude().value}');
      // 주소 가져오기
      // 주소 출력
      print('네이버 어쩔어쩔???');
    } catch (e) {
      print('주소 없음');
    }
  }

  @override
  ////해본거
  void initState() {
    GlobalController2();
    super.initState();
  }

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final pixelRatio = mediaQuery.devicePixelRatio;
    final mapSize = Size(mediaQuery.size.width, mediaQuery.size.height - 72);
    final physicalSize =
        Size(mapSize.width * pixelRatio, mapSize.height * pixelRatio);
    print("physicalSize: $physicalSize 네이버 맵 실행 됨");
    return Scaffold(
      body: Center(
          child: SizedBox(
              width: mapSize.width,
              height: mapSize.height,
              // color: Colors.greenAccent,
              child: _naverMapSection())),
    );
  }

  // Widget _naverMapSection() => NaverMap(
  //       options: const NaverMapViewOptions(
  //           indoorEnable: true,
  //           locationButtonEnable: false,
  //           consumeSymbolTapEvents: false),
  //       onMapReady: (controller) async {
  //         _mapController = controller;
  //         mapControllerCompleter.complete(controller);
  //         //log("onMapReady", name: "onMapReady");
  //       },
  //     );
  Widget _naverMapSection() => NaverMap(
        options: const NaverMapViewOptions(
          indoorEnable: true,
          locationButtonEnable: true,
          consumeSymbolTapEvents: true,
          //initialCameraPosition: NCameraPosition(target: NLatLng(globalController.getLatitude().value, longitude), zoom: 15)
        ),
        onMapReady: (controller) async {
          _mapController = controller;
          mapControllerCompleter.complete(controller);

          ///해본거
          print('${lat}${lon}');

          //log("onMapReady", name: "onMapReady");
          // 현재 위치 가져오기
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          // 현재 위치로 지도 이동
          final latLng = NLatLng(position.latitude, position.longitude);
          final cameraUpdate =
              NCameraUpdate.scrollAndZoomTo(target: latLng, zoom: 15);
          //cameraUpdate.setAnimation(NCameraAnimation.fly, duration: Duration(seconds: 2));
          //_mapController.moveCamera(cameraUpdate);
          // _mapController.moveCamera(
          //   NCameraPosition(
          //     target: latLng,
          //     zoom: 15.0,
          //   ),
          // );
        },
      );
}
