import 'Destination.dart';

class Region {
  String name;
  String img;
  List<Destination> destinations;

  Region(this.name, this.img, [this.destinations]);

  factory Region.fromJson(dynamic json) {
    //final json = jsonDecode(jsonData);
    if (json['destination'] != null) {
      var regionObjsJson = json['destination'] as List;
      List<Destination> _destinations = regionObjsJson
          .map((regionJson) => Destination.fromJson(regionJson))
          .toList();
      //log(json['region'].toString());
      return Region(
        json['name'] as String,
        json['img'] as String,
        _destinations,
      );
    } else {
      return Region(
        json['name'] as String,
        json['img'] as String,
      );
    }
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.img}, ${this.destinations} }';
  }
}
