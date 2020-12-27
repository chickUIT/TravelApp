import 'package:flutter/material.dart';

import '../enums.dart';
import 'body_profile.dart';
import 'coustom_bottom_nav_bar.dart';

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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}