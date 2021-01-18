import 'dart:convert';
import 'dart:developer';

import 'package:travelapp/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination(this.imageUrl, this.city, this.country, this.description,
      [this.activities]);

  factory Destination.fromJson(dynamic json) {
    log(json['imageUrl'] as String);
    if (json['activity'] != null) {
      var activityObjJson = json['activity'] as List;
      List<Activity> _activities = activityObjJson
          .map((activityJson) => Activity.fromJson(activityJson))
          .toList();
      return Destination(
        json['imageUrl'] as String,
        json['city'] as String,
        json['country'] as String,
        json['description'] as String,
        _activities,
      );
    } else {
      return Destination(json['imageUrl'] as String, json['city'] as String,
          json['country'] as String, json['description'] as String);
    }
  }
}

List<Destination> getDestinations(dynamic jsonData) {
  final json = jsonDecode(jsonData);
  var destinationObjJson = json['destination'] as List;
  List<Destination> _destinations = destinationObjJson
      .map((regionJson) => Destination.fromJson(regionJson))
      .toList();
  return _destinations;
}
