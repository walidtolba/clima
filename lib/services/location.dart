import 'package:geolocator/geolocator.dart';


class Location {
  late double latitude;
  late double longitude;

  Future<bool> askForPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    bool permission = await askForPermission();
    if (permission) {
          Position position  = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } else {
      print('Permission denied');
    }
  }
}