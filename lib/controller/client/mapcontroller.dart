import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final myMarker = Set<Marker>().obs;
  final kGooglePlex = CameraPosition(
    target: LatLng(2, 3),
    zoom: 17.4746,
  ).obs;

  Future<void> getPosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    final cl = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    kGooglePlex.value = CameraPosition(
      target: LatLng(cl.latitude, cl.longitude),
      zoom: 17.4746,
    );
  }
  Future<void> changeMarker(double newLat, double newLong) async {
    myMarker.remove(Marker(markerId: MarkerId("1")));
    myMarker.add(
      Marker(
        draggable: true,
        markerId: MarkerId("1"),
        position: LatLng(newLat, newLong),
      ),
    );
  }
}