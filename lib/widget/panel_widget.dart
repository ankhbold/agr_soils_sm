import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          SizedBox(height: 12),
          buildDragHandle(),
          SizedBox(height: 18),
          Center(
            child: Text(
              'Explore New York',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
            ),
          ),
          SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildIconWidget('Popular', Icons.favorite, Colors.blue),
              buildIconWidget('Food', Icons.restaurant, Colors.red),
              buildIconWidget('Events', Icons.event, Colors.amber),
              buildIconWidget('More', Icons.more_horiz, Colors.green),
            ],
          ),
          SizedBox(height: 36),
          buildImages(),
          SizedBox(height: 36),
          buildAboutText(),
          SizedBox(height: 24),
        ],
      );

  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  Widget buildIconWidget(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Icon(icon, color: Colors.white),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 8),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Text(label),
        ],
      );

  Widget buildImages() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Images',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Image.network(
                    'https://source.unsplash.com/random?new+york+city+buildings&sig=$index',
                    height: 110,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              '''New York City is one of the most known cities-symbols of the USA located in the northwestern part of the country, on the Atlantic coast. It is known as a global business capital city and one of the most populous, developed, innovative, and bustling cities of the world. New York is a true wonder of the US, and it can open its secrets and beautiful atmosphere to anyone who comes to visit it. It is located on the mouth of the Hudson River and is a destination for all kinds of tourists and guests, from business people to various tourists seeking some rest and new adventures.

The city has 5 famous central boroughs like Manhattan, Brooklyn, Queens, and others, and it is also known as the city located on one of the largest natural harbors on the continent. The city is home to some most visited tourist attractions of the world including Central Park, Times Square, the Metropolitan Museum of Arts, the Broadway Theater, and many more. The city has a really long history based on the social development of the city as the center of all aspects of the life of the country. NYC is also a key educational center of the US, with over 10 dozens of higher educational establishments operating.
The city has 5 famous central boroughs like Manhattan, Brooklyn, Queens, and others, and it is also known as the city located on one of the largest natural harbors on the continent. The city is home to some most visited tourist attractions of the world including Central Park, Times Square, the Metropolitan Museum of Arts, the Broadway Theater, and many more. The city has a really long history based on the social development of the city as the center of all aspects of the life of the country. NYC is also a key educational center of the US, with over 10 dozens of higher educational establishments operating.
The city has 5 famous central boroughs like Manhattan, Brooklyn, Queens, and others, and it is also known as the city located on one of the largest natural harbors on the continent. The city is home to some most visited tourist attractions of the world including Central Park, Times Square, the Metropolitan Museum of Arts, the Broadway Theater, and many more. The city has a really long history based on the social development of the city as the center of all aspects of the life of the country. NYC is also a key educational center of the US, with over 10 dozens of higher educational establishments operating.
                ''',
            ),
          ],
        ),
      );
}
