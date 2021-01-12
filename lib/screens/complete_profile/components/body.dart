import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/splash/components/body.dart';
import '../../../size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travelapp/homepage.dart';

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
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
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
                if (_firstName.text == "" || _lastName.text == "" || _phoneNumber.text == "" || _address.text == "") {
                  _showToast("You need write full infomation");
                } else {
                  completeInfo();
                }
              }
            },
          ),

        ],
      ),
    );
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

  Future<void> completeInfo() async {
    try {
      _auth.currentUser().then((user) {
        FirebaseDatabase.instance.reference().child("allUser").child(user.uid).set({
          "name": _firstName.text + _lastName.text,
          "phone": _phoneNumber.text,
          "address": _address.text,
        });
      });
      _showToast("Register suscess");
      Navigator.pushNamed(context, HomePage.routeName);
    } catch (error) {
      _showToast(error);
    }
  }
  
  TextFormField buildfirstnameField() {
    return TextFormField(
      controller: _firstName,
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
      controller: _lastName,
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
      controller: _phoneNumber,
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
      controller: _address,
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
