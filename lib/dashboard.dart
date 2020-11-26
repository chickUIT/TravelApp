import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:workoutapp/detailspage.dart';
import 'package:workoutapp/lang/VietNam.json';
import 'package:workoutapp/Country.dart';
import 'Service.dart';
class DashboardPage extends StatefulWidget  {
  @override
  _DashboardPageState createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    log('me m');
    Country _country = Service.getCountry();
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
              _buildListItem('assets/vietnam.jpg', 'VietNam',
                  'Land of the Ascending Dragon'),
              _buildListItem(
                  'assets/japan.jpg', 'Japan', 'Land of The Rising Sun'),
              _buildListItem(
                  'assets/australia.jpg', 'Australia', 'Land of The Kangaroo'),
            ],
          ),
        ),
      ],
    );
  }

  _buildListItem(String imgPath, String countryName, String description) {
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
                      image: AssetImage(imgPath),
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
                      countryName,
                      style: GoogleFonts.montserrat(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      description,
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
                            builder: (context) => DetailsPage(
                                imgPath: imgPath, title: countryName)));
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
