
import 'package:agr_soils/pages/splash_screen.dart';
import 'package:agr_soils/pages/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agr_soils/common/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/geo/crs/crs.dart';
import 'package:flutter_map/src/map/flutter_map_state.dart';
import 'package:flutter_map/src/map/map.dart';
// import 'package:flutter_map/src/plugins/plugin.dart';
// import 'package:latlong/latlong.dart';
import 'package:latlong2/latlong.dart';
import 'nav_screen.dart';
import 'bottom_sheet.dart';

export 'src/core/point.dart';
export 'src/geo/crs/crs.dart';
export 'src/geo/latlng_bounds.dart';
export 'src/layer/circle_layer.dart';
export 'src/layer/group_layer.dart';
export 'src/layer/layer.dart';
export 'src/layer/marker_layer.dart';
export 'src/layer/mbtiles/mbtiles_image_provider.dart';
export 'src/layer/overlay_image_layer.dart';
export 'src/layer/polygon_layer.dart';
export 'src/layer/polyline_layer.dart';
export 'src/layer/tile_layer.dart';
export 'src/plugins/plugin.dart';


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

    return Scaffold(

      backgroundColor: Color.fromRGBO(28, 35, 38, 100),
      body: _buildMap(),
      appBar: _buildAppBar(context),
      // bottomNavigationBar: MyHomePage(),
      bottomNavigationBar: _showBottomNav(),


    );
  }
  int _selectedIndex = 0;
  Widget _showBottomNav()
  {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.leak_add_sharp),
          label: 'Fields',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_motion_outlined),
          label: 'Notes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_sharp),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_rounded),
          label: 'Insight',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),



      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }
  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }
}

AppBar _buildAppBar(context) {
  return AppBar(

    backgroundColor: Colors.white,


    elevation: 0.5,
    iconTheme: IconThemeData(color: Colors.white),
    flexibleSpace:Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
          )
      ),
    ),

    actions: [


      Container(
        margin: EdgeInsets.only( top: 16, right: 16,),
        child: Stack(
          children: <Widget>[
            Icon(Icons.notifications),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      )
    ],
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
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


