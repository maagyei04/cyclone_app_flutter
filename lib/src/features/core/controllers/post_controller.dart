import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/features/core/models/post_model.dart';
import 'package:cyclone/src/features/core/screens/home/home.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();

  //TextField Controllers To Get Data From TextFields
  final name = TextEditingController();
  final description = TextEditingController();
  final brand = TextEditingController();
  final year = TextEditingController();
  final location = TextEditingController();
  final category = TextEditingController();

  final userRepo = Get.put(UserRepository());


  addPost(PostModel user) async {
    await userRepo.addUserPost(user);
    Get.back();
  }

}