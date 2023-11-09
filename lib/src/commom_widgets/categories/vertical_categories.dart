import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalCategories extends StatelessWidget {
  const TVerticalCategories({
    super.key, 
    required this.title, 
    this.textColor = tDarkColor, 
    this.backgroundColor = tWhiteColor, 
    this.onTap,
  });

  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: tDefaultSize - 25),
        child: Column(
          children: [
            Container(
              height: 30,
              width: 90,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(title, style: TextStyle(color: textColor,fontSize: 13,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}

