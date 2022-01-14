import 'package:flutter/material.dart';
import 'AboutScreen.dart';
import 'HomeScreen.dart';
import 'MapScreen.dart';


class BottomBar extends StatefulWidget {
  @override 
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
  int currentIndex=0;
  final List<Widget> screens =[
    HomeScreen(),
    MapScreen(),
    AboutScreen(),
  ];
  @override 
  Widget build(BuildContext context){
    return Scaffold(
    body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 40,
        //selectedFontSize: 20,
        //unselectedFontSize: 15,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(()=>currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red[700],
             ),
             BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
            backgroundColor: Colors.red[700],
             ),
             BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.red[700],
             ),
        ])
  );
  }
}