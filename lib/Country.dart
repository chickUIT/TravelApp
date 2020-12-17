import 'dart:convert';
import 'Region.dart';

class Country {
  String name;
  String img;
  String description;
  List<Region> regions;

  Country(this.name, this.img, this.description, [this.regions]);

  factory Country.fromJson(dynamic jsonData) {
    final json = jsonDecode(jsonData);
    if (json['region'] != null) {
      var regionObjsJson = json['region'] as List;
      List<Region> _regions = regionObjsJson
          .map((regionJson) => Region.fromJson(regionJson))
          .toList();
      return Country(
        json['name'] as String,
        json['img'] as String,
        json['description'] as String,
        _regions,
      );
    } else {
      return Country(
        json['name'] as String,
        json['img'] as String,
        json['description'] as String,
      );
    }
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.img}, ${this.regions} }';
  }
}
