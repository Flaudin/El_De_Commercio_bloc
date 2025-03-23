import 'dart:async';
import 'package:location/location.dart';
import 'package:tracking_app/data/model/location_model.dart';

class LocationRepository {
  final Location location = Location();

  Future<bool> checkPermission() async {
    bool serviceEnabled;
    PermissionStatus permission;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    // Check if the location permission is granted
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  Future<LocationModel?> getCurrentLocation() async {
    try {
      if (!await checkPermission()) {
        return null;
      }

      final locationData = await location.getLocation();
      return LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<LocationModel> getLocationUpdates() {
    return location.onLocationChanged.map((locationData) {
      return LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        timestamp: DateTime.now(),
      );
    });
  }
}
