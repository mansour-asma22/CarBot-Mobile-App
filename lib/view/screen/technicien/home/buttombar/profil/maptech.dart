import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapTech extends StatefulWidget {
  @override
  State<MapTech> createState() => _MapTechState();
}

class _MapTechState extends State<MapTech> {

  Position?cl;
  CameraPosition? _kGooglePlex;


   Future<void> getpos() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
  cl= await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        _kGooglePlex = CameraPosition(
        target: LatLng(cl!.latitude, cl!.longitude), zoom: 17.4746);
   }
  Set<Marker> mymarker = {
    Marker(
       draggable: true,
      
        markerId: MarkerId("1"),
        position: LatLng(30, 40),
      ),
  };

 Chang(newlat,newlong)async{
    mymarker.remove(Marker(markerId: MarkerId("1")));
    await mymarker.add(Marker(markerId: MarkerId("1"),position: LatLng(newlat, newlong)));
   
  }
@override
void initState() {
  getpos();
  
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
           Container(
          child: Stack(
           children: [
             GoogleMap(
               markers:mymarker,
                initialCameraPosition: _kGooglePlex == null
           ? CameraPosition(target: LatLng(2, 3))
           : _kGooglePlex!,
             ),
             Positioned(
               bottom: 110.0,
               left: 335.0,
               child: IconButton(onPressed: ()async{
                 setState(() {
                   Chang(cl!.latitude,cl!.longitude);
                 });
               },  
               icon: Icon(Icons.my_location_outlined,size: 30,color: Color.fromARGB(255, 249, 5, 5),) ,
               
               ),
             ),
           ],
          ),
        
        )
            
    );
  }
}