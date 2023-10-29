import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To Avoid Creating Instances


  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tSecondaryColor,
      side: const BorderSide(
      color: tSecondaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight),
    ),    
  );


  static final darkOulinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tWhiteColor,
      side: const BorderSide(
      color: tWhiteColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight),
    ), 
  );
}