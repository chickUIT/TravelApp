import 'package:flutter/material.dart';
import 'package:travelapp/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(child: Text("Sign Up"), alignment: Alignment.centerLeft  ),
      ),
      body: Body(),
    );
  }
}