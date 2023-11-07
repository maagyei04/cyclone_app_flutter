import 'package:cyclone/src/features/authentication/models/school_model.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/models/image_picker_model.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final school = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final phoneNumber = _authRepo.firebaseUser.value?.phoneNumber;

    if (phoneNumber != null) {
      return _userRepo.getUserDetails(phoneNumber);
    } else {
      Get.snackbar('Error', 'Login to continue', duration: const Duration(seconds: 6));
    }
  }

  Future<List<UserModel>> getAllUsers() async => _userRepo.allUsers();

  updateRecords(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

  updateRecordsSchool(SchoolModel user) async {
    await _userRepo.updateUserRecordSchool(user);
  }

  uploadProfileImage(ProfileImageModel user) async {
    await _userRepo.saveProfileImage(user);
  }
}