import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:yong_project/locations/location.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:yong_project/logout/signout.dart';
//import 'package:yong_project/page/new_screen.dart';
import 'package:yong_project/screen/first_screen.dart';
import 'package:yong_project/screen/lotto_screen.dart';
import 'package:yong_project/screen/naver_map.dart';
//import 'package:yong_project/screen/naver_map.dart';
import 'package:yong_project/screen/second_screen.dart';
import 'package:yong_project/screen/thrid_screen.dart';
//import 'package:yong_project/services/google_service.dart';
// import 'package:yong_project/services/kakao_login.dart';
// import 'package:yong_project/services/kakao_main_view.dart';
import 'package:yong_project/startpage.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final viewModel = MAinViewModel(KakaoLoginUp());
  int currentIndex = 0;
  final screens = [
    FirstScreen(),
    NaverMapScreen(),
    //SecondScreen(),
    LottoScreen(),
    ThirdScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    // Signout _signout = Signout();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.transparent,
        //backgroundColor: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            getCurrentLocation();
            //getAddressFromCoordinates();
            print('title 누름');
          },
          child: Text(
            '대전 서구 둔산동',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        // title: Text(
        //   '대전 서구 둔산동',
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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
      ),
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
            print(index);
            currentIndex = index;
          });
          // print(index);
          // switch (index) {
          //   case 0:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => HomeScreen()),
          //     // );
          //     break;
          //   case 1:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => NewScreen()),
          //     // );
          //     break;
          //   case 2:
          //     currentIndex;
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => NewScreen()),
          //     // );
          //     break;
          // }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '메뉴'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz_sharp), label: '로또'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
  //     void _onMapCreated(NaverMapController controller) {
  //   if (_controller.isCompleted) _controller = Completer();
  //   _controller.complete(controller);
  // }
}

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 위치 서비스가 비활성화되어 있을 때 처리할 내용 작성
    return Future.error('Location services are disabled.');
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  String lat = position.latitude.toString();
  String lon = position.longitude.toString();
  print(lat);
  print(lon);
  return position;
}

Future<void> getAddressFromCurrentLocation() async {
  // 현재 위치 가져오기
  Position currentPosition = await getCurrentLocation();

  // 현재 위치의 위도와 경도 값을 추출
  double latitude = currentPosition.latitude;
  double longitude = currentPosition.longitude;

  // 주소 가져오기
  String address = await getAddressFromCoordinates(latitude, longitude);

  // 주소 출력
  print(address);
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
  String address =
      '${placemark.administrativeArea} ${placemark.locality} ${placemark.thoroughfare}';
  print(address);
  return address;
}

// Future<String> getAddressFromCoordinates(
//     double latitude, double longitude) async {
//   List<Placemark> placemarks =
//       await placemarkFromCoordinates(latitude, longitude);
//   if (placemarks.isEmpty) {
//     // 주소를 찾을 수 없을 때 처리할 내용 작성
//     return 'Unknown';
//   }

//   Placemark placemark = placemarks.first;
//   String address =
//       '${placemark.administrativeArea} ${placemark.locality} ${placemark.thoroughfare}';
//   print(address);
//   return address;
// }
