import 'package:geolocator/geolocator.dart';

class LocationClass {
  double longitude;
  double latitude;

  Future<void> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
