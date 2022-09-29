
import 'package:agr_soils/pages/splash_screen.dart';
import 'package:agr_soils/pages/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:latlong/latlong.dart';

import 'forgot_password_page.dart';
import 'forgot_password_verification_page.dart';
import 'login_page.dart';
import 'registration_page.dart';

class MainPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    var point = 0;
    return Stack(

      children: [
        FlutterMap(
          options: MapOptions(
            onTap: (p) async {
              setState(() {
                var point = p;
                print(p);
              });
              // location = await Geocode.local.findAddressesFromCoordinates(
              //     new Coordinates(p.latitude, p.longitude));
              //
              // setState(() {
              //   point = p;
              //   print(p);
              // });
              //
              // print(
              //     "${location.first.countryName} - ${location.first.featureName}");
              GeoCode geoCode = GeoCode();

              try {
                Coordinates coordinates = await geoCode.forwardGeocoding(
                    address: "532 S Olive St, Los Angeles, CA 90013");

                print("Latitude: ${coordinates.latitude}");
                print("Longitude: ${coordinates.longitude}");
              } catch (e) {
                print(e);
              }

            },
            center: LatLng(49.5, -0.09),
            zoom: 5.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: point,
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    hintText: "Search for your localisation",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "${location.first.countryName},${location.first.locality}, ${location.first.featureName}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}