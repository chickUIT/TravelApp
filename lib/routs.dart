import 'package:flutter/widgets.dart';
import 'package:travelapp/profile/profile_screen.dart';
import 'package:travelapp/screens/main_view/home_screen.dart';
import 'package:travelapp/screens/complete_profile/complete_profile_screen.dart';
import 'package:travelapp/screens/sign_in/sign_in_screen.dart';
import 'package:travelapp/screens/sign_up/sign_up_screen.dart';
import 'package:travelapp/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  ProfileSceen.routeName: (context) => ProfileSceen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
