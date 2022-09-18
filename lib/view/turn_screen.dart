// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'my_trip_view.dart';
import 'trip_view.dart';
import 'turn_view.dart';
import 'warning_view.dart';

class TurnScreen extends StatefulWidget {
  const TurnScreen({Key? key}) : super(key: key);

  @override
  State<TurnScreen> createState() => _TurnScreenState();
}

class _TurnScreenState extends State<TurnScreen> {

  int _currentIndex = 0;
  String _appBarTitle = 'Vez';

  final List<Widget> _screens = [
    TurnView(),
    TripView(),
    MyTripView(),
    WarningView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xE5F8D14F),
        iconSize: 24,
        backgroundColor: const Color(0xFF316762),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Vez',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Viagens'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Minhas viagens'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Avisos'
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            changeAppBarTitle();
          });
        },
      ),
    );
  }

  void changeAppBarTitle(){
    switch(_currentIndex){
      case 0:
        _appBarTitle = 'Vez';
        break;
      case 1:
        _appBarTitle = 'Viagens';
        break;
      case 2:
        _appBarTitle = 'Minhas viagens';
        break;
      case 3:
        _appBarTitle = 'Avisos';
        break;
    }
  }
}
