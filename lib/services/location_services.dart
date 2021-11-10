import 'package:geolocator/geolocator.dart';
import 'package:testing/constant/constant.dart';

Future getUserLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return;
    // return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showErrorSnackBar('Location Service Denied');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    showErrorSnackBar('Location Service Denied forever');
    return;
    // return Future.error('Location permissions are denied forever.');
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  return position;
}
