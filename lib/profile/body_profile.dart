import 'package:flutter/material.dart';
import 'package:travelapp/profile/profile_menu.dart';
import 'package:travelapp/screens/splash/splash_screen.dart';



class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),),
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
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
          ),
          ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
        ),
          ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
          ),
          ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
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

