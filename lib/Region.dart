import 'dart:convert';

import 'dart:developer';

class Region {
  String name;

  Region(this.name);

  factory Region.fromJson(dynamic json) {
    return Region(json['name'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}}';
  }
}
