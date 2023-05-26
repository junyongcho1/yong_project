import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:yong_project/locations/global_controller.dart';

class Locations {
  double lati = 0;
  double long = 0;

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

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
    double latitude = globalController.getLatitude().value;
    double longitude = globalController.getLongitude().value;

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
}
