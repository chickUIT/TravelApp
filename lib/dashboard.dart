import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/destinationpage.dart';
import 'Country.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String jsonStringVI;
  String jsonStringJP;
  String jsonStringAU;

  @override
  void initState() {
    super.initState();
    load().then((data) {
      setState(() {
        this.jsonStringVI = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Country _country = Service.getCountry();
    if (jsonStringVI == null) {
      log('Dashboard: Loading data');
      return Center(
        child: Text(
          "PLEASE WAIT",
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      log('Dashboard: Render');
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFFFD4F99)),
                  child: Center(
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "HOME",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFFF353535)),
                  child: Center(
                    child: Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 150.0,
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                _buildListItem(jsonStringVI),
              ],
            ),
          ),
        ],
      );
    }
  }

  Future load() async {
    jsonStringVI = await rootBundle.loadString('lib/data/VietNam.json');
    return jsonStringVI;
    // jsonStringJP = await rootBundle.loadString('lib/lang/VietNam.json')
  }

  _buildListItem(String jsonString) {
    Country country = Country.fromJson(jsonString);
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            Container(height: 300.0),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(country.img),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken))),
            ),
            Container(
              height: 300.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      country.name,
                      style: GoogleFonts.montserrat(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      country.description,
                      style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DestinationPage(country)));
                      },
                      child: Container(
                        height: 50.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Explore now',
                            style: GoogleFonts.montserrat(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                textStyle: TextStyle(color: Color(0xFFFD4F99))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
