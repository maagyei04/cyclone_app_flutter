import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To Avoid Creating Instances


  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tWhiteColor,
      backgroundColor: tPrimaryColor,
      side: const BorderSide(
        color: tPrimaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight),
    ),
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(
        color: tPrimaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight),
    ),
  );
}