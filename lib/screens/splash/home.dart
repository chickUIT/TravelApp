import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/models/destination_model.dart';
import 'package:travelapp/models/hotel_model.dart';
import 'package:travelapp/widgets/destination_carousel.dart';
import 'package:travelapp/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../size_config.dart';

class HomeScreen1 extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {

  int _selectedIndex = 0;
  int _currentTab = 0;
  String jsonString = null;

  List<Hotel> hotels;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  void initState() {
    super.initState();
    load().then((data) {
      setState(() {
        this.jsonString = data;
        this.destinations = getDestinations(jsonString);
        this.hotels = getHotels(jsonString);
        log('Set state');
      });
    });
  }

  List<Destination> destinations;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(destinations),
            SizedBox(height: 20.0),
            HotelCarousel(hotels),
          ],
        ),
      ),
    );
  }

  Future load() async {
    //jsonString = await rootBundle.loadString('assets/data/data.json');
    final http.Response response = await http.get(
        'https://6007fe54309f8b0017ee51c2.mockapi.io/api/v1/destination',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response.body.toString();

    // log("Data loaded");
    // return jsonString;
  }
}
