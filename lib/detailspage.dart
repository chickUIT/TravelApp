import 'package:flutter/material.dart';
import 'package:travelapp/mappage.dart';

class DetailsPage extends StatefulWidget {
  //final img, title, latitude, longtitude;
  //DetailsPage(this.img, this.title, this.latitude, this.longtitude);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.asset('assets/japan.jpg', fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Japan\nLand of JAV",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "8.4/100 reviews",
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        )),
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
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ]),
                                SizedBox(height: 5.0),
                                Text(
                                  "4.0 / 5.0",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
                                ),
                              ])),
                          Column(
                            children: <Widget>[
                              Text(
                                "200\$ - 400\$",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "/per day",
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
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MapPage()));
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?, Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
