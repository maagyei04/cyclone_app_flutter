import 'package:cyclone/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._(); //To Avoid Creating Instances


  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(color: tWhiteColor),
  );


  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(color: tWhiteColor),
  );
}