import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';


import '../../../../../controller/client/mapcontroller.dart';


class MapPage extends StatelessWidget {
  final controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                mapType: MapType.hybrid,
                markers: controller.myMarker.value,
                initialCameraPosition: controller.kGooglePlex.value,
              ),
            ),
            Positioned(
              bottom: 110.0,
              left: 335.0,
              child: IconButton(
                onPressed: () async {
                  await controller.getPosition();
                  await controller.changeMarker(
                      controller.kGooglePlex.value.target.latitude,
                      controller.kGooglePlex.value.target.longitude);                },
                icon: Icon(
                  Icons.my_location_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 249, 5, 5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
