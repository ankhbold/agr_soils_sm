import 'package:flutter/material.dart';

import '../data/listdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/geo/crs/crs.dart';
import 'package:flutter_map/src/map/flutter_map_state.dart';
import 'package:flutter_map/src/map/map.dart';
import 'package:latlong2/latlong.dart';

// export '/src/core/point.dart';
// export '/src/geo/crs/crs.dart';
// export '/src/geo/latlng_bounds.dart';
// export '/src/layer/circle_layer.dart';
// export '/src/layer/group_layer.dart';
// export '/src/layer/marker_layer.dart';
// export '/src/layer/mbtiles/mbtiles_image_provider.dart';
// export '/src/layer/overlay_image_layer.dart';
// export '/src/layer/polygon_layer.dart';
// export '/src/layer/polyline_layer.dart';
// export '/src/layer/tile_layer.dart';
// export '/src/plugins/plugin.dart';

 
class HomePage extends StatefulWidget{

 const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
     return _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color.fromRGBO(28, 35, 38, 100),
      body: _buildMap(),
     
      // bottomNavigationBar: MyHomePage(),
     


    );
  }
 

}


FlutterMap _buildMap() {
  return new FlutterMap(

    options: MapOptions(
      center: LatLng(50.093057, 105.715020),
      zoom: 9.2,
    ),
    nonRotatedChildren: [
      AttributionWidget.defaultWidget(
        source: 'OpenStreetMap contributors',
        onSourceTapped: null,
      ),
    ],
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
    ],
  );
}




