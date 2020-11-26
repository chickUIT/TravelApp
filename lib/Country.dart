import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    Country({
        this.name,
        this.img,
        this.region,
    });

    String name;
    String img;
    List<Region> region;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        img: json["img"],
        region: List<Region>.from(json["region"].map((x) => Region.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "region": List<dynamic>.from(region.map((x) => x.toJson())),
    };
}

class Region {
    Region({
        this.name,
        this.img,
        this.desination,
        this.destination,
    });

    String name;
    String img;
    List<Desination> desination;
    List<Desination> destination;

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"],
        img: json["img"],
        desination: json["desination"] == null ? null : List<Desination>.from(json["desination"].map((x) => Desination.fromJson(x))),
        destination: json["destination"] == null ? null : List<Desination>.from(json["destination"].map((x) => Desination.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "desination": desination == null ? null : List<dynamic>.from(desination.map((x) => x.toJson())),
        "destination": destination == null ? null : List<dynamic>.from(destination.map((x) => x.toJson())),
    };
}

class Desination {
    Desination({
        this.name,
        this.img,
        this.location,
    });

    String name;
    String img;
    String location;

    factory Desination.fromJson(Map<String, dynamic> json) => Desination(
        name: json["name"],
        img: json["img"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "location": location,
    };
}
