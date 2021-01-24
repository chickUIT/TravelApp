class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;
  double latitude;
  double longitude;
  String description;

  Activity(this.imageUrl, this.name, this.type, this.startTimes, this.rating,
      this.price, this.latitude, this.longitude, this.description);

  factory Activity.fromJson(dynamic json) {
    var activityObjJson = json['startTimes'] as List;
    List<String> _activities = activityObjJson
        .map((activityJson) => (activityJson) as String)
        .toList();
    return Activity(
        json['imageUrl'] as String,
        json['name'] as String,
        json['type'] as String,
        _activities,
        int.parse(json['rating'] as String),
        int.parse(json['price'] as String),
        double.parse(json['lat'] as String),
        double.parse(json['lon'] as String),
        json['description'] as String);
  }
}
