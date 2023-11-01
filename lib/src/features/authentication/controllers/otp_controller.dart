import 'package:cyclone/src/features/authentication/screens/school_select/school_select.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();


  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const SchoolSelectScreen()) : Get.back();
  }
}