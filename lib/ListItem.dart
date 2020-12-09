import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workoutapp/Country.dart';

class ListItem extends StatelessWidget{
  @override
  final int index;
  ListItem(this.index);
  Widget build(BuildContext context)
  {
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
                      image: NetworkImage('https://i.pinimg.com/236x/6b/f0/03/6bf00353acb97adfc092c1f7d997387d.jpg'),
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
                      countryList[index].name,
                      style: GoogleFonts.montserrat(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(countryList[index].region[index].desination[index].name
                      ,
                      style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                     InkWell(
                    //   // onTap: () {
                    //   //   Navigator.of(context).push(MaterialPageRoute(
                    //   //       builder: (context) => DetailsPage(
                    //   //           imgPath: , title: countryName)));
                    //   },
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