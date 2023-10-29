import 'package:cyclone/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();


  static InputDecorationTheme lightInputDecorationTheme = 
    const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: TextStyle(
        color: tSecondaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0, 
          color: tSecondaryColor,
        ),
      ),
      
            
    );


  static InputDecorationTheme darkInputDecorationTheme = 
    const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: TextStyle(
        color: tPrimaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0, 
          color: tPrimaryColor,
        ),
      )      
    );
}