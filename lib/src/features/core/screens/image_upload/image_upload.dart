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

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ImagePickerController());
    final controller2 = Get.put(ProfileController());
    final controller3 = Get.put(UserRepository());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tAppName, style: Theme.of(context).textTheme.bodyLarge,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: FutureBuilder(
          future: controller2.getUserData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                return 
                  SingleChildScrollView(
                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(

                                  children: [
                    Text(tImageUploadTitle, style: Theme.of(context).textTheme.displayLarge,),
                    const SizedBox(height: tFormHeight - 20,),
                    Text(tImageUploadSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium,),
                    const SizedBox(height: tFormHeight + 15,),
                                  ],
                                ),
                          
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                    side:  const BorderSide(color: tPrimaryColor),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20.0),
                    foregroundColor: const Color.fromARGB(255, 4, 2, 2), 
                                  ),
                                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: tPrimaryColor,
                      radius: 120.0,
                      backgroundImage: controller.image.value.path != ''
                          ? NetworkImage(controller.image.value.path)
                          : null,
                      child: controller.image.value.path == ''
                          ? const Icon(Icons.camera_alt_rounded)
                          : null,
                    ),
                  
                                  ),
                                ),
                          
                                const SizedBox(height: tFormHeight + 20,),
                          
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
                          
                                const SizedBox(height: tFormHeight + 20,),
                          
                                Row(
                                  children: [
                    Expanded(
                      child: OutlinedButton(
                      onPressed: () {
                        Get.offAll(() => const NavigationMenu());
                      },
                       child: const Text(tSkip,),
                      ),
                    ),
                    const SizedBox(width: tFormHeight -20,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          String imageUrl = await controller3.uploadProfileImage();
                          
                          final userData = ProfileImageModel (
                            id: user.id,
                            picture: imageUrl,
                          );
                          
                          await controller2.uploadProfileImage(userData);
                          
                          Get.offAll(() => const NavigationMenu());
                        }, 
                        child: const Text(tContinue),
                      ),
                    )
                                  ],
                                )
                          
                              ],
                            ),
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