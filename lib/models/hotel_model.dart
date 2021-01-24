import 'dart:convert';

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  int rating;
  double latitude;
  double longitude;
  String description;

  Hotel(this.imageUrl, this.name, this.address, this.price, this.latitude,
      this.longitude, this.description, this.rating);

  factory Hotel.fromJson(dynamic json) {
    return Hotel(
        json['imageUrl'] as String,
        json['name'] as String,
        json['address'] as String,
        int.parse(json['price'] as String),
        double.parse(json['lat'] as String),
        double.parse(json['lon'] as String),
        json['description'] as String,
        int.parse(json['rating']));
  }
}

List<Hotel> getHotels(dynamic jsonData) {
  final json = jsonDecode(jsonData);
  var destinationObjJson = json['hotel'] as List;
  List<Hotel> _destinations = destinationObjJson
      .map((regionJson) => Hotel.fromJson(regionJson))
      .toList();
  return _destinations;
}
