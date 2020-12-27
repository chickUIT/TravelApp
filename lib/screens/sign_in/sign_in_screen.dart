import 'package:flutter/material.dart';
import 'package:travelapp/screens/sign_in/components/body.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(child: Text("Sign In"), alignment: Alignment.centerLeft ),
      ),
      body: Body(),
    );
  }
}

