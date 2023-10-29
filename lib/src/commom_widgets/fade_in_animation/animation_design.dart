import 'package:cyclone/src/commom_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:cyclone/src/commom_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFadeInAnimation extends StatelessWidget {
   TFadeInAnimation({super.key, this.animatePosition, required this.durationInMs, required this.child});

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      duration: Duration(milliseconds: durationInMs),
      top: controller.animate.value ? animatePosition!.topAfter : animatePosition!.topBefore,
      left: controller.animate.value ? animatePosition!.leftAfter : animatePosition!.leftBefore,
      bottom: controller.animate.value ? animatePosition!.bottomAfter : animatePosition!.bottomBefore,
      right: controller.animate.value ? animatePosition!.rightAfter : animatePosition!.rightBefore,

      child: AnimatedOpacity(
        opacity: controller.animate.value ? 1 : 0,
        duration: Duration(milliseconds: durationInMs),  
        child: child,
        //child: const Image(image: AssetImage(tSplashIcon)),    
      ),
    ));
  }
}