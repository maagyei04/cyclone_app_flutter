
import 'package:cyclone/src/commom_widgets/curved_widget.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: SizedBox(
        height: 250,

        child: Container(
          color: tPrimaryColor,
          padding: const EdgeInsets.all(0),
    
    
    
          child: Stack(
            children: [
              Positioned(right: -10, top: -90,child: Container(
                width: 150,
                padding: const EdgeInsets.all(0),
                height: 150,
                decoration: BoxDecoration(
                color: tWhiteColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(150),
              ),),),
              Positioned(right: 230, top: 90,child: Container(
                width: 150,
                padding: const EdgeInsets.all(0),
                height: 150,
                decoration: BoxDecoration(
                color: tWhiteColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(150),
              ),),),
              child,
            ],
          ),
        ),
      ),
    );
  }
}