import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:project_flutter/api/fetch_weather.dart';
//import 'package:project_flutter/models/weather_data.dart';

class GlobalController extends GetxController {
//  create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

//  instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  //final weatherData = WeatherData().obs;

  // getWeatherData() {
  //   return weatherData.value;
  // }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  getLocation() async {
    // bool isServiceEnabled;
    // LocationPermission locationPermission;

// Test if location services are enabled.
    // isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!isServiceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   // 위치 서비스가 비활성화되어 있을 때 처리할 내용 작성
    //   return Future.error("Location not enabled");
    // }

    // locationPermission = await Geolocator.checkPermission();

    // if (locationPermission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error("Location permission are denied forever");
    // } else if (locationPermission == LocationPermission.denied) {
    //   locationPermission = await Geolocator.requestPermission();
    //   if (locationPermission == LocationPermission.denied) {

    //     return Future.error("Location permission is denied");
    //   }
    // }

    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission != LocationPermission.whileInUse &&
    //       permission != LocationPermission.always) {
    //     // 권한이 거부되었을 때 처리할 내용 작성
    //     return Future.error("Location permission is denied");
    //   }
    // }

    // Future<void> requestLocationPermission() async {
    //   LocationPermission permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission != LocationPermission.whileInUse &&
    //         permission != LocationPermission.always) {
    //       // 권한이 거부되었을 때 처리할 내용 작성
    //       return;
    //     }
    //   }
    // }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      // return FetchWeatherAPI()
      //     .processData(value.latitude, value.longitude)
      //     .then((value) {
      //   //weatherData.value = value;
      //   _isLoading.value = false;
      // });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
