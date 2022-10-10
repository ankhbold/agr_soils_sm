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
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    switch (_selectedIndex) {
      case 0:
        child = _buildMap();
        break;
      case 1:
        child = Text(
          'Index 1: Home',
          style: optionStyle,
        );
        break;
      case 2:
        child = Text(
          'Index 2: Home',
          style: optionStyle,
        );
        break;
      case 3:
        child = Text(
          'Index 3: Home',
          style: optionStyle,
        );
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 35, 38, 100),
      body: SizedBox.expand(child: child),
      appBar: _buildAppBar(context),
      // bottomNavigationBar: MyHomePage(),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.leak_add_sharp),
          label: 'Талбай',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_motion_outlined),
          label: 'Тэмдэглэл',
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
          label: 'Профайл',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}

AppBar _buildAppBar(context) {
  
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.5,
    iconTheme: IconThemeData(color: Colors.white),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ])),
    ),
    actions: [
   Container(
        margin: EdgeInsets.only( top: 16, right: 16,),
       child: Container(
        height: 40,
        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            border: Border.all()),
      ),
   ),
      Container(
        margin: EdgeInsets.only( top: 16, left: 16,),
        child: Stack(
          children: <Widget>[
           new IconButton(
            icon: new Icon(
              Icons.arrow_downward_outlined,
            ),
            onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
          ),
            Positioned(
              right: 0,
              child: 
              Container(
                padding: EdgeInsets.all(1),
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
