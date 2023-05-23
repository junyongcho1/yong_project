import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yong_project/page/home_screen.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({super.key});

  @override
  State<NaverMapScreen> createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late NaverMapController _mapController;
  final Completer<NaverMapController> mapControllerCompleter = Completer();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final pixelRatio = mediaQuery.devicePixelRatio;
    final mapSize = Size(mediaQuery.size.width, mediaQuery.size.height - 72);
    final physicalSize =
        Size(mapSize.width * pixelRatio, mapSize.height * pixelRatio);

    print("physicalSize: $physicalSize");
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
            consumeSymbolTapEvents: true),
        onMapReady: (controller) async {
          _mapController = controller;
          mapControllerCompleter.complete(controller);
          //log("onMapReady", name: "onMapReady");
          // 현재 위치 가져오기
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          // 현재 위치로 지도 이동
          final latLng = NLatLng(position.latitude, position.longitude);
          // _mapController.moveCamera(
          //   CameraPosition(
          //     target: latLng,
          //     zoom: 15.0,
          //   ),
          // );
        },
      );
}
