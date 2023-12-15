import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:cyclone/src/features/authentication/screens/mail_verification/mail_verification.dart';
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


Future<void> registerUser(UserModel user) async {
  try {
    final auth = AuthenticationRepository.instance;

    // Create user in Firebase Authentication
    await auth.createUserWithEmailAndPassword(user.email, user.password);

    // Delay the execution of createUser function by 2 seconds (adjust as needed)
    await Future.delayed(const Duration(seconds: 3), () async {
      await userRepo.createUser(user);
    });

    // Navigate to verification screen
    Get.offAll(() => const MailVerificationScreen());
  } catch (e) {
    // Handle authentication or Firestore errors
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent.withOpacity(0.3),
      colorText: Colors.red,
      duration: const Duration(seconds: 5),
    );
  }
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
      phoneAuthentication(user.phoneNumber);
      await userRepo.createUser(user);
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