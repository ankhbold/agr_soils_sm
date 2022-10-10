import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:agr_soils/sliding_up_panel.dart';
import 'main_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widget/maps_widget.dart';
import '../widget/panel_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double fabHeightClosed = 116.0;
  double fabHeight = fabHeightClosed;

  final panelController = PanelController();

  @override
  void initState() {
    super.initState();

    fabHeight = fabHeightClosed;
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            controller: panelController,
            maxHeight: panelHeightOpen,
            minHeight: panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: MapsWidget(),
            panelBuilder: (controller) => PanelWidget(
              controller: controller,
              panelController: panelController,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            onPanelSlide: (position) => setState(() {
              final panelMaxScrollExtent = panelHeightOpen - panelHeightClosed;

              fabHeight = position * panelMaxScrollExtent + fabHeightClosed;
            }),
          ),
          Positioned(right: 20, bottom: fabHeight, child: buildFAB(context)),
          Positioned(top: 52, child: buildTitle()),
        ],
      ),
    );
  }

  Widget buildFAB(BuildContext context) => FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.gps_fixed,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {},
      );

  Widget buildTitle() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Text(
          MainPage.title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16),
          ],
        ),
      );
}
