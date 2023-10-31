import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
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

  //Call This Function Design & It Will Do The Rest
  void registerUser(String email, String password) {
     AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

}