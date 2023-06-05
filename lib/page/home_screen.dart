import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:yong_project/locations/global_controller.dart';
import 'package:yong_project/locations/location.dart';
import 'package:yong_project/screen/first_screen.dart';
import 'package:yong_project/screen/lotto_screen.dart';
import 'package:yong_project/screen/naver_map.dart';
import 'package:yong_project/screen/second_screen.dart';
import 'package:yong_project/screen/thrid_screen.dart';
import 'package:yong_project/startpage.dart';
import 'package:geolocator/geolocator.dart';

// class HomeScreen extends StatefulWidget {
//   //const HomeScreen({super.key});
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String city = '';

//   final GlobalController globalController =
//       Get.put(GlobalController(), permanent: true);

//   final Locations locations = Locations();

//   Future<void> getAddressFromCurrentLocation() async {
//     try {
//       //Future<void>
//       // 현재 위치 가져오기
//       //Position currentPosition = await locations.getCurrentLocation();
//       // 현재 위치의 위도와 경도 값을 추출
//       double latitude = globalController.getLatitude().value;
//       double longitude = globalController.getLongitude().value;

//       print('위도+${globalController.getLatitude().value}');
//       print('경도+${globalController.getLongitude().value}');
//       // 주소 가져오기
//       String address = await getAddressFromCoordinates(latitude, longitude);
//       // 주소 출력
//       print('이건 111111');
//     } catch (e) {
//       print('주소 없음');
//     }
//   }

//   Future<String> getAddressFromCoordinates(
//       double latitude, double longitude) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(latitude, longitude);
//     print(placemarks);
//     if (placemarks.isEmpty) {
//       // 주소를 찾을 수 없을 때 처리할 내용 작성
//       return 'Unknown';
//     }

//     Placemark placemark = placemarks.first;
//     String address = ' ${placemark.locality} ${placemark.subLocality}';
//     //${placemark.administrativeArea}
//     setState(() {
//       this.city = address;
//     });
//     print(address);
//     print('이건 222222');
//     return address;
//   }

//   ///////여기랑!!!!!!!!!!!!!!!!1
//   void initData() async {
//     await globalController.getLocation();
//     getAddressFromCurrentLocation();
//   }

//   //final viewModel = MAinViewModel(KakaoLoginUp());
//   int currentIndex = 0;
//   final screens = [
//     FirstScreen(),
//     NaverMapScreen(),
//     LottoScreen(),
//     ThirdScreen(),
//   ];
//   @override
//   /////////여기랑!!!!!!!!!!!!!!!!1
//   void initState() {
//     //globalController.getLocation();
//     //getAddressFromCurrentLocation();
//     // initData();
//     super.initState();
//     initData();
//   }
//   // getAddressFromCoordinates(globalController.getLatitude().value,
//   //     globalController.getLongitude().value);
//   //getAddressFromCurrentLocation();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         title: InkWell(
//           onTap: () {
//             locations.getCurrentLocation();
//             print('title 누름');
//           },
//           child: Text(
//             city,
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//         // title: Text(
//         //   '대전 서구 둔산동',
//         //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         // ),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               //print(city);
//               // print(lat);
//               // print(lon);
//               print(globalController.getLatitude().value);
//               print(globalController.getLongitude().value);
//             },
//             icon: Icon(Icons.search),
//             color: Colors.black,
//             tooltip: '검색',
//           ),
//           IconButton(
//             onPressed: () {
//               // getAddressFromCoordinates();
//               getAddressFromCurrentLocation();
//             },
//             icon: Icon(Icons.shopping_cart_outlined),
//             color: Colors.black,
//             tooltip: '장바구니',
//           )
//         ],
//       ),
//       body: IndexedStack(
//         index: currentIndex,
//         children: screens,
//       ),
//       ////////////bottom navigation bar////////////////////
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Color.fromARGB(255, 71, 233, 133),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             if (index == 0) {
//               print('홈');
//             } else if (index == 1) {
//               print('지도');
//             } else if (index == 2) {
//               print('로또');
//             } else {
//               print('프로필');
//             }
//             currentIndex = index;
//           });

//           // print(index);
//           // switch (index) {
//           //   case 0:
//           //     currentIndex;
//           //     // Navigator.push(
//           //     //   context,
//           //     //   MaterialPageRoute(builder: (context) => HomeScreen()),
//           //     // );
//           //     break;
//           //   case 1:
//           //     currentIndex;
//           //     // Navigator.push(
//           //     //   context,
//           //     //   MaterialPageRoute(builder: (context) => NewScreen()),
//           //     // );
//           //     break;
//           //   case 2:
//           //     currentIndex;
//           //     // Navigator.push(
//           //     //   context,
//           //     //   MaterialPageRoute(builder: (context) => NewScreen()),
//           //     // );
//           //     break;
//           // }
//         },
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
//           BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
//           BottomNavigationBarItem(icon: Icon(Icons.quiz_sharp), label: '로또'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
//         ],
//       ),
//     );
//   }
// }

// Future<Position> getCurrentLocation() async {
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // 위치 서비스가 비활성화되어 있을 때 처리할 내용 작성
//     return Future.error('Location services are disabled.');
//   }

//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
//   String lat = position.latitude.toString();
//   String lon = position.longitude.toString();
//   print(lat);
//   print(lon);
//   return position;
// }

// Future<void> getAddressFromCurrentLocation() async {
//   try {//Future<void>
//     // 현재 위치 가져오기
//     Position currentPosition = await getCurrentLocation();
//     // 현재 위치의 위도와 경도 값을 추출
//     double latitude = currentPosition.latitude;
//     double longitude = currentPosition.longitude;

//     // 주소 가져오기
//     String address = await getAddressFromCoordinates(latitude, longitude);
//     // 주소 출력
//     print(address);

//     // setState(() {
//     //   city = address;
//     // });
//     // setState(() {
//     //   this.address = address;
//     // });
//   } catch (e) {
//     print('주소 없음');
//   }
// }

// Future<String> getAddressFromCoordinates(
//     double latitude, double longitude) async {
//   List<Placemark> placemarks =
//       await placemarkFromCoordinates(latitude, longitude);
//   print(placemarks);
//   if (placemarks.isEmpty) {
//     // 주소를 찾을 수 없을 때 처리할 내용 작성
//     return 'Unknown';
//   }

//   Placemark placemark = placemarks.first;
//   String address = ' ${placemark.locality} ${placemark.subLocality}';
//   //${placemark.administrativeArea}
//   print(address);
//   return address;
// }

///////////////////////////////

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = '';

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  final Locations locations = Locations();

  Future<void> getAddressFromCurrentLocation() async {
    try {
      //Future<void>
      // 현재 위치 가져오기
      //Position currentPosition = await locations.getCurrentLocation();
      // 현재 위치의 위도와 경도 값을 추출
      double latitude = globalController.getLatitude().value;
      double longitude = globalController.getLongitude().value;

      print('위도+${globalController.getLatitude().value}');
      print('경도+${globalController.getLongitude().value}');
      // 주소 가져오기
      String address = await getAddressFromCoordinates(latitude, longitude);
      // 주소 출력
      print('이건 111111');
    } catch (e) {
      print('주소 없음');
    }
  }

  Future<String> getAddressFromCoordinates(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    if (placemarks.isEmpty) {
      // 주소를 찾을 수 없을 때 처리할 내용 작성
      return 'Unknown';
    }

    Placemark placemark = placemarks.first;
    String address = ' ${placemark.locality} ${placemark.subLocality}';
    //${placemark.administrativeArea}
    setState(() {
      this.city = address;
    });
    print(address);
    print('이건 222222');
    return address;
  }

  ///////여기랑!!!!!!!!!!!!!!!!1
  void initData() async {
    await globalController.getLocation();
    getAddressFromCurrentLocation();
  }

  //final viewModel = MAinViewModel(KakaoLoginUp());
  int currentIndex = 0;
  final screens = [
    FirstScreen(),
    NaverMapScreen(),
    LottoScreen(),
    ThirdScreen(),
  ];
  @override
  /////////여기랑!!!!!!!!!!!!!!!!1
  void initState() {
    //globalController.getLocation();
    //getAddressFromCurrentLocation();
    // initData();
    super.initState();
    initData();
  }
  // getAddressFromCoordinates(globalController.getLatitude().value,
  //     globalController.getLongitude().value);
  //getAddressFromCurrentLocation();

  Widget build(BuildContext context) {
    PreferredSizeWidget getCurrentAppBar() {
      if (currentIndex == 0) {
        return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              locations.getCurrentLocation();
              print('title 누름');
            },
            child: Text(
              city,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          // title: Text(
          //   '대전 서구 둔산동',
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //print(city);
                // print(lat);
                // print(lon);
                print(globalController.getLatitude().value);
                print(globalController.getLongitude().value);
              },
              icon: Icon(Icons.search),
              color: Colors.black,
              tooltip: '검색',
            ),
            IconButton(
              onPressed: () {
                // getAddressFromCoordinates();
                getAddressFromCurrentLocation();
              },
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              tooltip: '장바구니',
            )
          ],
        );
      } else if (currentIndex == 1) {
        return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              locations.getCurrentLocation();
              print('title 누름');
            },
            child: Text(
              city,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          // title: Text(
          //   '대전 서구 둔산동',
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //print(city);
                // print(lat);
                // print(lon);
                print(globalController.getLatitude().value);
                print(globalController.getLongitude().value);
              },
              icon: Icon(Icons.search),
              color: Colors.black,
              tooltip: '검색',
            ),
            IconButton(
              onPressed: () {
                // getAddressFromCoordinates();
                getAddressFromCurrentLocation();
              },
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              tooltip: '장바구니',
            )
          ],
        );
      } else if (currentIndex == 2) {
        return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            '로또',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // InkWell(
          //   onTap: () {
          //     locations.getCurrentLocation();
          //     print('title 누름');
          //   },
          //   child: Text(
          //     '로또',
          //     style:
          //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // title: Text(
          //   '대전 서구 둔산동',
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //print(city);
                // print(lat);
                // print(lon);
                print(globalController.getLatitude().value);
                print(globalController.getLongitude().value);
              },
              icon: Icon(Icons.search),
              color: Colors.black,
              tooltip: '검색',
            ),
            IconButton(
              onPressed: () {
                // getAddressFromCoordinates();
                getAddressFromCurrentLocation();
              },
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              tooltip: '장바구니',
            )
          ],
        );
      } else {
        return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            '프로필',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          //InkWell(
          //   onTap: () {
          //     locations.getCurrentLocation();
          //     print('title 누름');
          //   },
          //   child: Text(
          //     '프로필',
          //     style:
          //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // title: Text(
          //   '대전 서구 둔산동',
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //print(city);
                // print(lat);
                // print(lon);
                print(globalController.getLatitude().value);
                print(globalController.getLongitude().value);
              },
              icon: Icon(Icons.search),
              color: Colors.black,
              tooltip: '검색',
            ),
            IconButton(
              onPressed: () {
                // getAddressFromCoordinates();
                getAddressFromCurrentLocation();
              },
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              tooltip: '장바구니',
            )
          ],
        );
      }
    }

    return Scaffold(
      appBar: getCurrentAppBar(),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      ////////////bottom navigation bar////////////////////
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 71, 233, 133),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              print('홈');
            } else if (index == 1) {
              print('지도');
            } else if (index == 2) {
              print('로또');
            } else {
              print('프로필');
            }
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz_sharp), label: '로또'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
