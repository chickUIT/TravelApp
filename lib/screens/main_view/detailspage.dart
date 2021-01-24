import 'package:flutter/material.dart';
import 'package:travelapp/screens/main_view/mappage.dart';

class DetailsPage extends StatefulWidget {
  final String img;
  final String name;
  final int price;
  final String description;
  final double latitude, longtitude;
  final int rating;
  DetailsPage(this.name, this.img, this.description, this.latitude,
      this.longtitude, this.price, this.rating);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.asset(widget.img, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {})
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                _buildRatingStars(widget.rating),
                                SizedBox(height: 5.0),
                                Text(
                                  "${widget.rating}.0 / 5.0",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
                                ),
                              ])),
                          Column(
                            children: <Widget>[
                              Text(
                                "\$ ${widget.price}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "/ người",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.blueAccent[200],
                          textColor: Colors.white,
                          child: Text(
                            "Go Now",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MapPage(
                                    widget.latitude, widget.longtitude)));
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
