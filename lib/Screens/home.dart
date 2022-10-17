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

class _HomePage extends State<HomePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.85,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Parcel list",
                  ),
                  
                  background: _buildMap(),
                  
                ),
              ),
            ];
          },
          body: Center(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [      
                      Text(
                        "Search field",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                          TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0Xff302360),
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                            ),
                            hintText: "Search field",
                            prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset('images/${geter()[index].image!}',
                            height: 40),
                      ),
                      title: Text(
                        geter()[index].name!,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        geter()[index].time!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        geter()[index].fee!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color:
                              geter()[index].buy! ? Colors.red : Colors.green,
                        ),
                      ),
                    );
                  },
                  childCount: geter().length,
                ),
              )
            ],
          )),
     
        ),
         appBar: _buildAppBar(context),
      ),
    ));
  }
}


    AppBar _buildAppBar(context) {
      return AppBar(
        
        actions: [
        // ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        //      shape: RoundedRectangleBorder(
        //      borderRadius: BorderRadius.circular(4.0) 
                  
                 
        //           ),
        //       // style: ElevatedButton.styleFrom(
        //       //   shape: const StadiumBorder(),
        //       ),
              
        //       child: const Text('Pill '),
        //       onPressed: () {},     
        //     ),       
     

          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        
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




