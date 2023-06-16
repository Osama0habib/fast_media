import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff2A2F4F);
const Color kSeconderyColor = Color(0xffFFB801);
const Color kWireframe_1 = Color(0xff525252);
const Color kWireframe_2 = Color(0xff626262);
Color kWireframe_3 = const Color(0xffD2D2D2).withOpacity(0.5);
Color kWireframe_4 = const Color(0xffEAEAEA).withOpacity(0.1);

const Gradient kGradient = LinearGradient(
  colors: [
    Color(0xff06081B),
    Color(0xff4B3675),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  tileMode: TileMode.repeated,
    // stops: [0.6,0.9,0.0]
  // stops: [1.0, 0.5],
);
