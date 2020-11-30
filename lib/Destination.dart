import 'dart:convert';
import 'dart:developer';

import 'Region.dart';

class Destination {
  String name;
  String img;
  List<Region> regions;

  Destination(this.name, this.img, [this.regions]);

  factory Destination.fromJson(dynamic jsonData) {
    final json = jsonDecode(jsonData);
    if (json['region'] != null) {
      var regionObjsJson = json['region'] as List;
      List<Region> _regions = regionObjsJson
          .map((regionJson) => Region.fromJson(regionJson))
          .toList();
      log(json['region'].toString());
      return Destination(
        json['name'] as String,
        json['img'] as String,
        _regions,
      );
    } else {
      return Destination(
        json['name'] as String,
        json['img'] as String,
      );
    }
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.img}, ${this.regions} }';
  }
}
