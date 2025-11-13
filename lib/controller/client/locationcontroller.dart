import 'package:get/get.dart';
 import 'package:geolocator/geolocator.dart';


abstract class Location_Controller extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  Future<void> getLocation() ;
  Future<void> getpermission();
}
class Location_ControllerImp extends Location_Controller {

  @override
  Future<void> getLocation() async {
    print("Demande de localisation...");

    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      print(" Le GPS est désactivé ! Active-le et réessaie.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    print("Permission actuelle : $permission");

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print("Permission refusée définitivement !");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
    if (position.isMocked) {
      print(" Attention ! La localisation est simulée !");
    } else {
      print(" La localisation semble être réelle.");
    }


    latitude.value = position.latitude;
    longitude.value = position.longitude;

    print('Nouvelle Latitude: ${position.latitude}');
    print('Nouvelle Longitude: ${position.longitude}');
  }


  @override
  Future<void> getpermission()async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
  }

}
