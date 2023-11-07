import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  var otpController = Get.put(AuthenticationRepository());


  //TextField Controllers To Get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  //Call This Function Design & It Will Do The Rest
  void loginUser(String email, String password) {
     AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  void loginUserWithPhoneNumber(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }

  void verifyOTPLogin(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const NavigationMenu()) : Get.back();
  }
}