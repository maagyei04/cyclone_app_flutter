import 'package:cyclone/src/commom_widgets/fade_in_animation/animation_design.dart';
import 'package:cyclone/src/commom_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:cyclone/src/commom_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/screens/login/login_screen.dart';
import 'package:cyclone/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startWelcomeAnimation();


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animatePosition: TAnimatePosition(
              bottomAfter: 0, 
              bottomBefore: -100,
              leftBefore: 0,
              leftAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  Hero(
                    tag: 'Welcome-image-tag',
                    child: Image(
                      image: const AssetImage(tWelcomeScreenImage), 
                      height: height * 0.6,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(tWelcomeTitle, 
                      textAlign: TextAlign.center, 
                      style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20.0,),
                      Text(tWelcomeSubTitle,
                       textAlign: TextAlign.center,
                       style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                                        const SizedBox(height: 40.0,),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),                    
                          child: Text(
                            tLogin.toUpperCase()
                          )
                        )
                      ),
          
                      const SizedBox(width: 10.0,),
          
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const SignUpScreen()),               
                          child: const Text(tSignup)
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}