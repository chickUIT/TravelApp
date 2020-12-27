import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/Destination.dart';

class ListItem extends StatelessWidget {
  final int desindex;
  final List<Destination> topDes;
  ListItem(this.topDes, this.desindex);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(children: [
          Container(
              height: 200.0,
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                      image: AssetImage(topDes[desindex].img),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken)))),
          Positioned(
              top: 15.0,
              right: 15.0,
              child: Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  child: Center(
                      child: Icon(
                    Icons.bookmark_border,
                    color: Color(0xFFFD4F99),
                    size: 14.0,
                  )))),
          Positioned(
              top: 150.0,
              left: 15.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(topDes[desindex].name,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          textStyle: TextStyle(color: Colors.white))),
                  Text('200-400\$',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          textStyle: TextStyle(color: Colors.white)))
                ],
              ))
        ]));
  }
}
