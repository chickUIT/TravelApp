class Destination {
  String name;
  String img;

  Destination(this.name, this.img);

  factory Destination.fromJson(dynamic json) {
    return Destination(
      json['name'] as String,
      json['img'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.img} }';
  }
}
