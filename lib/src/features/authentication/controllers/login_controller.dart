import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  var otpController = Get.put(AuthenticationRepository());
  final userRepo = Get.put(UserRepository());

  //TextField Controllers To Get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  //Call This Function Design & It Will Do The Rest
  void loginUser(String email, String password) async {
    try {
      final auth = AuthenticationRepository.instance;
      await auth.loginUserWithEmailAndPassword(email, password);
      auth.setInitialScreen(auth.user);
    } catch (e) {
       Get.snackbar(
        'Oh Snap!!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }

  void loginUserWithPhoneNumber(String phoneNumber) async {
    var proceed = await userRepo.doesPhoneNumberExist(phoneNumber);
    if (proceed == true) {
      AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
      Get.to(() => const LoginOTPScreen());
    } else {
      print('User Doesn\'t Exist');
      Get.snackbar(
        'Error',
        'User Doesn\'t Exist',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }  }

  void verifyOTPLogin(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const NavigationMenu()) : Get.back();
  }
}