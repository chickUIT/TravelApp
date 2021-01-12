import 'package:flutter/material.dart';
import 'package:travelapp/profile/profile_menu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:travelapp/screens/splash/splash_screen.dart';

class BodyProfile extends StatefulWidget {
  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
String name = "";
String phoneNumber = "";
String address = "";

  @override
  void initState() {
    getInfoUser();
  }

  void getInfoUser() {
    _auth.currentUser().then((user) {
      FirebaseDatabase.instance.reference().child("allUser").child(user.uid).once().then((data) {
        setState(() {
          name = data.value["name"];
          phoneNumber = data.value["phone"];
          address = data.value["address"];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/avt.png"),
                  ),
                  Positioned(
                      right: -10,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          color: Color(0xFFF5F6F9),
                          onPressed: () {},
                          child: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ]),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: name,
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: phoneNumber,
            icon: "assets/icons/Call.svg",
            press: () {},
          ),
          ProfileMenu(
            text: address,
            icon: "assets/icons/Location point.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, SplashScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
