import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
    const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();


    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: obController.pages,
              liquidController: obController.controller,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: false,
              onPageChangeCallback: obController.onPageChangeCallback,
            ),
            Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () => obController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side:  const BorderSide(color: Color(0xFF398d1c)),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                  foregroundColor: Colors.white, 
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: tPrimaryColor, shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )
            ),
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => obController.skip(),
                child: const Text("Skip", style: TextStyle(color: Colors.white, fontSize: 15),),
              ),
            ),
            Obx(
              () => Positioned(
                top: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3, 
                  effect: const WormEffect(
                    activeDotColor: Color(0xFF398d1c),
                    dotHeight:8.0,
                    dotWidth: 50.0,
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }

}
