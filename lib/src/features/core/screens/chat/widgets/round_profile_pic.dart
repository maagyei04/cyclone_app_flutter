import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePic extends StatelessWidget {
  const MyProfilePic({super.key, required this.userId});

 final String userId;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(UserRepository());

    return GetBuilder<ProfileController>(
      builder: (controller) {
        final UserModel user = profileController.getUserInfoById(userId) as UserModel;

        if (user != null) {
          return GestureDetector(
            onTap: () {
              //
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.picture),
            ),
          );
        } else if (user == null) {
          return const CircleAvatar(
            radius: 20,
            child: CircularProgressIndicator(),
          );
        } else {
          return const CircleAvatar(
            radius: 20,
            child: Text('Error'),
          );
        }
      },
    );
  }
}
