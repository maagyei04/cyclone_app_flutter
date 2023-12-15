import 'package:cyclone/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();


  static InputDecorationTheme lightInputDecorationTheme = 
    const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: TextStyle(
        fontSize: 15,
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
      labelStyle: TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: TextStyle(
        fontSize: 15,
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