import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatelessWidget {
  final Completer<GoogleMapController> controller = Completer();
  final CameraPosition newYork = CameraPosition(
    target: LatLng(40.730610, -73.935242),
    zoom: 11.75,
  );

  @override
  Widget build(BuildContext context) => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: newYork,
        onMapCreated: (controller) => this.controller.complete(controller),
      );
}
