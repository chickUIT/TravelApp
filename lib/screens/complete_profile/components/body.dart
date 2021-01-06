import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/sign_in/sign_in_screen.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import '../../../size_config.dart';

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
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                "Complete Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete your details or register \nwith social media",
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
  bool _success;
  String _userEmail;
  String _notication;
  final _fornKey = GlobalKey<FormState>();
  String firstname;
  String lastname;
  String phone;
  String address;
  final List<String> errors = [];

  Widget build(BuildContext context) {

    return Form(
      key: _fornKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          buildfirstnameField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildlastnameField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildphoneField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildaddressField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButtom(
            text: "Rigister",
            press: () async {
              if (_fornKey.currentState.validate()) {

              }
            },
          ),

        ],
      ),
    );
  }

  
  TextFormField buildfirstnameField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      onSaved: (newValue) => firstname = newValue,
      decoration: InputDecoration(
        labelText: "First name",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your first name",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildlastnameField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      onSaved: (newValue) => lastname = newValue,
      decoration: InputDecoration(
        labelText: "Last name",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your last name",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildphoneField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      onSaved: (newValue) => phone = newValue,
      decoration: InputDecoration(
        labelText: "Phone Number",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your phone number",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildaddressField() {
    return TextFormField(
      style: TextStyle(color: Colors.white54),
      onSaved: (newValue) => address = newValue,
      decoration: InputDecoration(
        labelText: "Address",
        labelStyle: new TextStyle(color: Colors.white),
        hintText: "Enter your address",
        hintStyle: new TextStyle(color: Colors.white24),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
