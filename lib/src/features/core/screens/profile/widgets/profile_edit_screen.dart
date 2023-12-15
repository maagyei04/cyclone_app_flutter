// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/screens/profile/profile.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final controller = Get.put(ProfileController());
    final controller2 = Get.put(ImagePickerController());
    final controller3 = Get.put(UserRepository());


    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: Colors.transparent, 
        elevation: 0,
        centerTitle: true,
        title: Text('Profile', style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;

                  final firstName = TextEditingController(text: userData.firstName);
                  final lastName = TextEditingController(text: userData.lastName);
                  final email = TextEditingController(text: userData.email);
                  final password = TextEditingController(text: userData.password);
                  final phoneNumber = TextEditingController(text: userData.phoneNumber);
                  final school = TextEditingController(text: userData.school);
                  final picture = TextEditingController(text: userData.picture);

              return 
                   SingleChildScrollView(
                     child: Column(
                       children: [
                         Form(
                          key: formKey,
                           child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Obx(
                                         () => CircleAvatar(
                                          radius: 70,
                                           backgroundImage:
                                              controller2.image.value.path == ''
                                                ? NetworkImage(userData.picture)
                                                :  NetworkImage(
                                                    controller2.image.value.path,
                                                  )
                                         ),
                                       ), 
                                       TextButton(
                                        onPressed: () {
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
                                                      controller2.pickImageCamera();
                                                    },
                                                  ),
                                                  const SizedBox(height: tFormHeight - 10,),
                                                  ForgotPasswordBtnWidget(
                                                    btnIcon: Icons.photo_album_rounded,
                                                    title: 'Gallery',
                                                    subTitle: 'Select from Gallery',
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      controller2.pickImage();                          },
                                                  ),
                                                ]
                                              ),
                                            )
                                          ),
                                        );
                                          },
                                        child:  Text(
                                          'Edit profile image', 
                                          style: Theme.of(context).textTheme.displayMedium,
                                        )
                                        ),
                         
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                       const SizedBox(height: 10.0,),
                                       Text('First Name', style: Theme.of(context).textTheme.displayMedium,),
                                           TextFormField(
                                            controller: firstName,
                                             style: const TextStyle(fontSize: 15.0),
                                             decoration: const InputDecoration(
                                             hintText: 'firstname',
                                             ),
                                           ),
                                       const SizedBox(height: 5.0,),
                                       Text('Last Name', style: Theme.of(context).textTheme.displayMedium,),
                                           TextFormField(
                                            controller: lastName,
                                             style: const TextStyle(fontSize: 15.0),
                                             decoration: const InputDecoration(
                                             hintText: 'lastname',
                                             ),
                                           ), 
                                       const SizedBox(height: 5.0,),
                                       Text('Name Of School', style: Theme.of(context).textTheme.displayMedium,),
                                           TextFormField(
                                            controller: school,
                                             style: const TextStyle(fontSize: 15.0),
                                             decoration: const InputDecoration(
                                             hintText: 'school',
                                             ),
                                           ), 
                                       const SizedBox(height: 5.0,),
                                       Text('School Email', style: Theme.of(context).textTheme.displayMedium,),
                                           TextFormField(
                                            controller: email,
                                             style: const TextStyle(fontSize: 15.0),
                                             decoration: const InputDecoration(
                                             hintText: 'email',
                                             ),
                                           ), 
                                       const SizedBox(height: 5.0,),
                                       Text('Phone Number', style: Theme.of(context).textTheme.displayMedium,),
                                           TextFormField(
                                             controller: phoneNumber,
                                             style: const TextStyle(fontSize: 15.0),
                                             decoration: const InputDecoration(
                                             hintText: 'phone',
                                             ),
                                           ),
                                       const SizedBox(height: 40.0,),
                                           Row(
                                                                       children: [
                                                         Expanded(
                                                           child: OutlinedButton(
                                                           onPressed: () {
                                                             Get.back();
                                                           },
                                                           child: const Text(tSkip,),
                                                           ),
                                                         ),
                                                         const SizedBox(width: tFormHeight -20,),
                                                         Expanded(
                                                           child: ElevatedButton(
                                                             onPressed: () async {   
                                                                  String imageUrl = await controller3.uploadPostImage();
                                                                   if (imageUrl.isNotEmpty){
                                                                    imageUrl = imageUrl;
                                                                  } else {
                                                                    imageUrl = picture.text.trim();
                                                                  }
                         
                                                                    print(imageUrl);
                         
                                                                   if (formKey.currentState!.validate()) {
                                                                     if (firstName.text.isNotEmpty &&
                                                                         lastName.text.isNotEmpty &&
                                                                         email.text.isNotEmpty &&
                                                                         phoneNumber.text.isNotEmpty &&
                                                                         school.text.isNotEmpty
                                                                         ) {
                                           
                                                                       final user = UserModel(
                                                                         id: userData.id,
                                                                         firstName: firstName.text.trim(),
                                                                         lastName: lastName.text.trim(),
                                                                         email: email.text.trim(),
                                                                         phoneNumber: phoneNumber.text.trim(),
                                                                         school: school.text.trim(),
                                                                         password: password.text.trim(),
                                                                         picture: imageUrl,
                                                                       );
                                           
                                                                       await controller.updateRecords(user);
                                           
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
                                                             child: const Text(tContinue),
                                                           ),
                                                         )
                                                                       ],
                                                                     ) 
                                         ]
                                       )                       
                                     ],
                                   ),
                         ),
                       ],
                     ),
                   );
            } else if (snapshot.hasError) {
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
      ),
    );
  }
}