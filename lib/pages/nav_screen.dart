import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //List<String> _titles = ["Home", "Profile", "Insight", "Notes"];
  List<Widget> _items = [
    Text(
      'Index 0: Field',
    ),
    Text(
      'Index 1: Note',
    ),
    Text(
      'Index 2: Add',
    ),
    Text(
      'Index 3: Insight',
    ),
    Text(
      'Index 4: Profile',
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Learning"),
      ),
      body:Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items
          )//_items.elementAt(_index),
      ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

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