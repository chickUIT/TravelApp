import 'package:flutter/material.dart';
import 'body_profile.dart';

class ProfileSceen extends StatelessWidget {
  static String routeName = '/Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF888888),
        title: Text("Profile"),
      ),
      body: BodyProfile(),
    );
  }
}