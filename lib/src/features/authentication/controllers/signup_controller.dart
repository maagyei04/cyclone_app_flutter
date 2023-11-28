import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers To Get Data From TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call This Function Design & It Will Do The Rest
  void registerUser(String email, String password) {
     AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }

  void emailExist(String number) async{
    await userRepo.getUserDetails(number);
  }

  Future<void> createUser(UserModel user) async {

    var proceed = await userRepo.doesPhoneNumberExist(user.phoneNumber);

    if (proceed == false) {
      await userRepo.createUser(user);
      phoneAuthentication(user.phoneNumber);
      Get.to(() => const OTPScreen(), arguments: user.phoneNumber);
    } else {
      print ('User creation failed !!');
          Get.snackbar(
            "Error",
            "Account Already Exist!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.3),
            colorText: Colors.red,
            duration: const Duration(seconds: 5),
          );  
    }
  }

}