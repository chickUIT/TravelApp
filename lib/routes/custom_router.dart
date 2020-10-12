import 'package:flutter/material.dart';
import 'package:workoutapp/pages/about_page.dart';
import 'package:workoutapp/pages/home_page.dart';
import 'package:workoutapp/pages/notfound_page.dart';
import 'package:workoutapp/pages/setting_page.dart';
import 'package:workoutapp/routes/route_name.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingRoute:
        return MaterialPageRoute(builder: (_) => SettingPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
