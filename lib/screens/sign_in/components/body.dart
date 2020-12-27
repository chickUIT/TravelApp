import 'package:flutter/material.dart';
import 'package:travelapp/constants.dart';
import 'package:travelapp/homepage.dart';
import 'package:travelapp/screens/sign_up/sign_up_screen.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import 'package:travelapp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(50)),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your account and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForn(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, SignUpScreen.routeName),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kPrimaryColor,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForn extends StatefulWidget {
  @override
  _SignFornState createState() => _SignFornState();
}

class _SignFornState extends State<SignForn> {
  final _fornKey = GlobalKey<FormState>();
  String account;
  String password;
  bool remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fornKey,
      child: Column(
        children: [
          buildTextFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(60)),
          DefaultButtom(
            text: "Sign In",
            press: () {
              Navigator.pushNamed(context, HomePage.routeName);
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

  TextFormField buildTextFormField() {
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
