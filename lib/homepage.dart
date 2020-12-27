import 'package:flutter/material.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;
  List children = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B1B1B),
        selectedItemColor: Color(0xFFFD4F99),
        iconSize: 27.0,
        unselectedLabelStyle: TextStyle(color: Color(0xFF1B1B1B)),
        unselectedItemColor: Color(0xFF888888),
        onTap: (currentIndex) {
          setState(() {
            selectedItem = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.home),
            title: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFD4F99),
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.search),
            title: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFD4F99),
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.camera_alt),
            title: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFD4F99),
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(
              Icons.person_outline,
            ),
            //press: () {Navigator.pushNamed(context, ProfileSceen.routeName);};
            title: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFD4F99),
              ),
            ),
          ),
        ],
        currentIndex: selectedItem,
      ),
    );
  }
}
