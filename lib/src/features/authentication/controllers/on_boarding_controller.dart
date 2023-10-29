import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/model_on_boarding.dart';
import 'package:cyclone/src/features/authentication/screens/on_boarding/widgets/on_boarding_widget.dart';
import 'package:cyclone/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController{
  
  
    final controller = LiquidController();
    RxInt currentPage = 0.obs;
    RxBool animate = false.obs;
    
    
    final pages = [
      OnBoardingPage(
        model: OnBoardingModel(
          bgColor: tOnBoardingPage1Color,
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          image: tOnBoardingImage1,
          counterText: tOnBoardingCounter1,
        )
      ),

            OnBoardingPage(
        model: OnBoardingModel(
          bgColor: tOnBoardingPage2Color,
          title: tOnBoardingTitle2,
          subTitle: tOnBoardingSubTitle2,
          image: tOnBoardingImage2,
          counterText: tOnBoardingCounter2,
        )
      ),

            OnBoardingPage(
        model: OnBoardingModel(
          bgColor: tOnBoardingPage3Color,
          title: tOnBoardingTitle3,
          subTitle: tOnBoardingSubTitle3,
          image: tOnBoardingImage3,
          counterText: tOnBoardingCounter3,
        )
      ),
    ];

        
        Future startAnimation() async {
        await Future.delayed(const Duration(milliseconds: 500));
        animate.value = true;
        await Future.delayed(const Duration(milliseconds: 2000));
        Get.to(const WelcomeScreen());
      }

  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextpage = controller.currentPage + 1;
    if (nextpage == 3) {
      startAnimation();
    } else {
      controller.animateToPage(page: nextpage);
    }

  }
}