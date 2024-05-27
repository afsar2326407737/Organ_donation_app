// location_service.dart
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<String> getLocation() async {
    // Check location permissions
    PermissionStatus permission = await Permission.locationWhenInUse.status;

    if (permission != PermissionStatus.granted) {
      permission = await Permission.locationWhenInUse.request();
      if (permission != PermissionStatus.granted) {
        return 'Location permissions not granted';
      }
    }

    // Get the location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return 'Lat: ${position.latitude}, Long: ${position.longitude}';
  }
}
