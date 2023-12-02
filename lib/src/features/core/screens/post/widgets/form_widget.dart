// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_phone/forgot_password_phone.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/controllers/post_controller.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/controllers/request_controller.dart';
import 'package:cyclone/src/features/core/models/post_model.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

 final controller = Get.put(PostController());
 final controller2 = Get.put(ProfileController());
 final controller3 = Get.put(ImagePickerController());
 final controller4 = Get.put(UserRepository());


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
              var icon =  OutlinedButton.icon(
                      onPressed: () {
                        controller3.pickImageCamera();
                      },
                      icon: const Icon(Icons.camera_alt_rounded), 
                      label: const Text(''),
                    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight ),
      child: FutureBuilder(
        future: controller2.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
                                    print(userData.id);

              return 
                   Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              TextFormField(
                controller: controller.name,
                decoration: const InputDecoration(
                  label: Text(tName),
                  hintText: tName,
                ),
              ),
              const SizedBox(height: tFormHeight - 20,),
      
              TextFormField(
                controller: controller.brand,
                decoration: const InputDecoration(
                label: Text(tBrand),
                hintText: tBrand,
                ),
              ),
      
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.year,
                decoration: const InputDecoration(
                label:Text(tYear),
                hintText: tYear,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.location,
                decoration: const InputDecoration(
                label:Text(tLocation),
                hintText: tLocation,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.description,
                maxLines: 7,
                decoration: const InputDecoration(
                label:Text(tDescription),
                hintText: tDescription,
                ),
              ), 

              const SizedBox(height: tFormHeight - 20,),

              Obx(
                () => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                  context: context, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(tFormHeight - 10),
                  ),
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tForgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge,),
                          Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                          const SizedBox(height: tFormHeight,),
                          ForgotPasswordBtnWidget(
                            btnIcon: Icons.camera_enhance_rounded,
                            title: 'Camera',
                            subTitle: 'Take live image',
                            onTap: () {
                              Navigator.pop(context);
                              controller3.pickImageCamera();
                            },
                          ),
                          const SizedBox(height: tFormHeight - 10,),
                          ForgotPasswordBtnWidget(
                            btnIcon: Icons.photo_album_rounded,
                            title: 'Gallery',
                            subTitle: 'Select from Gallery',
                            onTap: () {
                              Navigator.pop(context);
                              controller3.pickImage();                          },
                          ),
                        ]
                      ),
                    )
                  ),
                );
                  },
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  kIsWeb ?
                      controller3.image.value.path == ''
                        ? const Icon(Icons.add_a_photo_rounded)
                        :  Image.network(
                            controller3.image.value.path, fit: BoxFit.cover,
                          ) 
                              
                          :
                              
                      controller3.image.value.path == ''
                        ? const Icon(Icons.add_a_photo_rounded)
                        : Image.file(
                          File(controller3.image.value.path), fit: BoxFit.cover,
                        ),
                  ),
                ),
              ),              
              
              const SizedBox(height: tFormHeight,),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
  onPressed: () async {
    String imageUrl = await controller4.uploadPostImage();

    if (formKey.currentState!.validate()) {
      if (controller.name.text.isNotEmpty &&
          controller.brand.text.isNotEmpty &&
          controller.year.text.isNotEmpty &&
          controller.location.text.isNotEmpty &&
          controller.description.text.isNotEmpty &&
          imageUrl.isNotEmpty) {

        final user = PostModel(
          userid: controller2.getID(),
          name: controller.name.text.trim(),
          description: controller.description.text.trim(),
          brand: controller.brand.text.trim(),
          year: controller.year.text.trim(),
          location: controller.location.text.trim(),
          photo: imageUrl,
        );

        PostController.instance.addPost(user);
      } else {
        // Handle case where not all fields are filled
      Get.snackbar(
        "Error",
        "Please fill all the fields and select image ",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 7),
      );
      }
    }
  },
  child: const Text('Post'),
)

              ) 
            ],
          )
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
        },
     
      ),
    );
  }



}

