import 'dart:convert';

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel(
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  );

  factory Hotel.fromJson(dynamic json) {
    return Hotel(json['imageUrl'] as String, json['name'] as String,
        json['address'] as String, int.parse(json['price'] as String));
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
