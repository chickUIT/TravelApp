import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 3),
        Text(
          "TRAVEL APP",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(40),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 3),
        Image.asset(
          image,
          height: getProportionateScreenHeight(450),
          width: getProportionateScreenWidth(300),
        ),
      ],
    );
  }
}
