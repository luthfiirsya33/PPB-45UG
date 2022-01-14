import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers ={};
  //late BitmapDescriptor mapMarker;
  // @override 
  // void initState(){
  //   super.initState();
  //   setCustomMarker();
  // }
  void setCustomMarker() async{
  //   mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/img/mapmarker.png');
   }
  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
        position: LatLng(-6.984008, 110.409287),
        //icon: mapMarker,
        infoWindow: InfoWindow(
          title: "Tugu Muda Semarang",
          snippet: "Bangunan Bersejarah",
        ) ));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        backgroundColor: Colors.red[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(-6.984008, 110.409287),
            zoom: 15, ),
        ),
      
    );
  }
}