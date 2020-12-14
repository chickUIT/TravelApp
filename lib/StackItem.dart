import 'package:flutter/material.dart';
import 'package:workoutapp/Country.dart';
import 'package:google_fonts/google_fonts.dart';
class stackItem extends StatelessWidget{
  Country country;
  int regindex;
  stackItem(this.country,this.regindex);
  @override 
  Widget build(BuildContext context){
  return Stack(
                children:<Widget>[ Padding(
                      padding: EdgeInsets.all(0.0),
                          child: Container(
                            height: 220.0,
                            width: 370.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('assets/kyoto.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken),
                              ),
                            ),
                          ),
                        ),
                      
                      Positioned(
                        top: 125.0,
                        left: 10.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(country.regions[regindex].name,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                      )),
                                  Text(
                                    'hihi',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14.0,
                                        textStyle:
                                            TextStyle(color: Colors.white)),
                                  )
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ),]);}
}