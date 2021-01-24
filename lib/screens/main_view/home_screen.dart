import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/profile/profile_screen.dart';
import 'package:travelapp/screens/splash/home.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_page';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  String jsonString;
  HomeScreen1 home;
  ProfileSceen profile = new ProfileSceen();
  @override
  void initState() {
    super.initState();
    load().then((data) {
      setState(() {
        this.jsonString = data;
        home = new HomeScreen1();
        home.jsonString = jsonString;
        log(home.jsonString);
        log('Set state');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (jsonString == null) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Image.asset(
              "assets/images/loading.gif",
              height: 250.0,
              width: 250.0,
            ),
          ),
        ),
      );
    } else {
      dynamic child;
      log("reload home");
      if (_selectedIndex > 1)
        child = profile;
      else
        child = home;
      return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (currentIndex) {
            setState(() {
              _currentTab = currentIndex;
              _selectedIndex = currentIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30.0,
              ),
              title: SizedBox.shrink(),
            )
          ],
        ),
      );
    }
  }

  Future load() async {
    //jsonString = await rootBundle.loadString('assets/data/data.json');
    final http.Response response = await http.get(
        'https://6007fe54309f8b0017ee51c2.mockapi.io/api/v1/destination',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return Utf8Decoder().convert(response.bodyBytes);

    // log("Data loaded");
    // return jsonString;
  }
}
