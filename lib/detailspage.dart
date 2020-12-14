import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workoutapp/ListItem.dart';
import 'package:workoutapp/StackItem.dart';
import 'Country.dart';

class DetailsPage extends StatefulWidget {
  final Country country;
  DetailsPage(this.country);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(widget.country.img),
              fit: BoxFit.cover,
            )),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 40.0,
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
                  widget.country.name.toString().toUpperCase(),
                  style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      textStyle: TextStyle(color: Colors.white)),
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFF353535),
                  ),
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
          Positioned(
            top: 120.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '  Trending Attractions',
                          style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  getRegionStack(),
                  Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: InkWell(
                                        child: Icon(Icons.arrow_forward_ios,
                                        color: Color(0xFFFD4F99), size: 14.0),
                                        onTap: (){
                                          setState(() {
                                            (_currentindex < widget.country.regions.length-1)?_currentindex++:_currentindex--;
                                            
                                          });
                                        },
                                  ),
                                ),
                              ),
                  SizedBox(height: 25.0),
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '  Weekly Highlights',
                          style: GoogleFonts.montserrat(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: widget.country.regions[_currentindex].destinations.length,
                         itemBuilder: (ctx ,i)=>listviewItem(widget.country.regions[_currentindex].destinations, i),
                  ),)
                   
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getRegionStack()
  {
    return IndexedStack(
                    index:_currentindex,
                    children: buildlistStack(),
                  );
  }
  List<stackItem> buildlistStack()
  {
    List<stackItem> stackList = List<stackItem>() ;
    for (int i = 0;i<widget.country.regions.length;i++)
    {
      stackList.add(stackItem(widget.country,i));
    }
    return stackList;
  }
}
