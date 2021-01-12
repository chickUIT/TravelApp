import 'package:flutter/material.dart';
import 'package:travelapp/screens/complete_profile/complete_profile_screen.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import 'package:travelapp/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformpasswordController = TextEditingController();
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
                if (_emailController.text == "" || _conformpasswordController.text == "" || _passwordController.text == "") {
                  _showToast("You need write full infomation");
                } else {
                  if (_passwordController.text != _conformpasswordController.text) {
                    print(password);
                    _showToast("Password and Confirm Password not correct !");
                  } else {
                    signUp(_emailController.text, _passwordController.text);
                  }
                }
               // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user;
    String errorMessage;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      email = user.email;
    } catch (error) {
      switch (error.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Anonymous accounts are not enabled";
          break;
        case "ERROR_WEAK_PASSWORD":
          errorMessage = "Your password is too weak";
          break;
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email is invalid";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = "Email is already in use on different account";
          break;
        case "ERROR_INVALID_CREDENTIAL":
          errorMessage = "Your email is invalid";
          break;

        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    if (errorMessage != null) {
      _showToast(errorMessage);
      return Future.error(errorMessage);
    } else {
      //Navigator.pushNamed(context, HomePage.routeName);
      Navigator.pushNamed(context, CompleteProfileScreen.routeName);
    }
    return errorMessage;
  }

  void _showToast (String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _conformpasswordController,
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
      controller: _passwordController,
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
