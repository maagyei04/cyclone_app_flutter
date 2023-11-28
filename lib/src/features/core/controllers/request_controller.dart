import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:cyclone/src/features/core/screens/home/home.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  static RequestController get instance => Get.find();

  //TextField Controllers To Get Data From TextFields
  final name = TextEditingController();
  final description = TextEditingController();
  final brand = TextEditingController();
  final year = TextEditingController();
  final location = TextEditingController();

  final userRepo = Get.put(UserRepository());


  addRequest(RequestModel user) async {
    await userRepo.addUserRequest(user);
    Get.back();
  }

}