import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);


class Country {
    Country({
        this.name,
        this.img,
        this.description,
        this.region,
    });

    String name;
    String img;
    String description;
    List<Region> region;
}

class Region {
    Region({
        this.name,
        this.img,
        this.desination,
    });

    String name;
    String img;
    List<Destination> desination;
}

class Destination {
    Destination({
        this.name,
        this.img,
        this.location,
    });

    String name;
    String img;
    String location;

}

final countryList = [
  Country(
    name: 'Viet Nam',
    img: 'assets/vietnam.jpg',
    description: 'gorgeous and friendly',
    region:[
      Region(
    name: 'Tay Ninh',
    img: 'xxxxxxx',
    desination: [
       Destination(
    name: 'Nui ba Den',
    img: 'xxxxx'
  ),
  Destination(
    name: 'toa thanh',
    img: 'xxxxx'
  )
    ],
     )
    ]
  )
];