import 'dart:async' show Future;
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer';
import 'Country.dart';

class Service{
  Service();
  static  Future<String>loadAsset() async {
    return await rootBundle.loadString('lib/lang/VietNam.json');
  }
  static Country getCountry() {
    log('me m');
    return countryFromJson(loadAsset().toString());
  }
}