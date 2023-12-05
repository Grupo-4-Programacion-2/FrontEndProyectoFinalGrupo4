import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'note_maps_controller.dart';

class noteMapPage extends StatelessWidget {

  noteMapController con = Get.put(noteMapController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UBICACION EN MAPA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _googleMaps(),
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 110),
          child: FloatingActionButton.extended(
            onPressed: con.goToTheLake,
            label: Text('Posicion'),
            icon: Icon(Icons.directions_boat),
          ),
        ),
      ),
    );
  }


  Widget _googleMaps() {
    return GoogleMap(
      initialCameraPosition: con.initialPosition,
      markers: {const Marker(markerId: MarkerId("Prueba"), position: LatLng(15.77924700, -86.78764500),)},
      mapType: MapType.normal,
      onMapCreated: con.onMapCreate,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
    );
  }

}

