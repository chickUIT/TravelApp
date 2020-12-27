import 'package:flutter/material.dart';
import 'package:travelapp/screens/complete_profile/complete_profile_screen.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import 'package:travelapp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(50)),
              Text(
                "Register Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete your details or continute \nwith social media",
                textAlign: TextAlign.center,
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _fornKey = GlobalKey<FormState>();
  String account;
  String password;
  String conformpassword;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fornKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          buildFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildPassword2FormField(),
          SizedBox(height: getProportionateScreenHeight(60)),
          DefaultButtom(
            text: "Continute",
            press: () {
              if (_fornKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your password",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPassword2FormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      obscureText: true,
      onSaved: (newValue) => conformpassword = newValue,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Re-enter your password",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      onSaved: (newValue) => account = newValue,
      decoration: InputDecoration(
        labelText: "Account",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your account",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
