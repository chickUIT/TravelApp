import 'package:flutter/material.dart';
import 'package:travelapp/constants.dart';
import 'package:travelapp/screens/sign_up/sign_up_screen.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import 'package:travelapp/size_config.dart';
import 'package:travelapp/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              if (_emailController.text == "" || _passwordController.text == "") {
                _showToast("Please enter full infomation");
              } else {
                signIn(_emailController.text, _passwordController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<String> signIn(String email, String password) async {
    FirebaseUser user;
    String errorMessage;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    if (errorMessage != null) {
      _showToast(errorMessage);
      return Future.error(errorMessage);
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
    return errorMessage;
  }

  void _showToast (String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
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
      controller: _emailController,
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
