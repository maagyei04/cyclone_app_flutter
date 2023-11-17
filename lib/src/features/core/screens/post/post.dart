import 'dart:io';

import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/models/image_picker_model.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ImagePickerController());
    final controller2 = Get.put(ProfileController());
    final controller3 = Get.put(UserRepository());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: FutureBuilder(
          future: controller2.getUserData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                return 
                  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(tPostScreenTitle, style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: tFormHeight - 20,),
                  Text(tPostScreenSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium,),
                  const SizedBox(height: tFormHeight - 10,),
                ],
              ),
        
              const SizedBox(height: tFormHeight - 10,),
        
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        controller.pickImageCamera();
                      },
                      icon: const Icon(Icons.camera_alt_rounded), 
                      label: Text(tImageUploadCameraText, style: Theme.of(context).textTheme.displayMedium,),
                    ),
                  ),
        
                  const SizedBox(height: tFormHeight - 10,),
        
        
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        controller.pickImage();
                      },
                      icon: const Icon(Icons.image_rounded), 
                      label: Text(tImageUploadGalleryText, style: Theme.of(context).textTheme.displayMedium,),
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: tFormHeight - 10,),
        
            ],
          );
              } else if (snapshot.hasError) {
                // ignore: avoid_print
                print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          } 
        ),
      ),
    );
  }
}