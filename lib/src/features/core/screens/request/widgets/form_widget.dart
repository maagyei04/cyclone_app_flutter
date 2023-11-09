// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/signup_controller.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

 final controller = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            TextFormField(
              controller: controller.firstName,
              decoration: const InputDecoration(
                label: Text(tName),
                hintText: tName,
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),

            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
              label: Text(tBrand),
              hintText: tBrand,
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),


            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
              label:Text(tYear),
              hintText: tYear,
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),


            TextFormField(
              controller: controller.lastName,
              decoration: const InputDecoration(
              label:Text(tLocation),
              hintText: tLocation,
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),


            TextFormField(
              maxLines: 7,
              decoration: const InputDecoration(
              label:Text(tDescription),
              hintText: tDescription,
              ),
            ), 
            
            const SizedBox(height: tFormHeight,),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  /* --
                  if(formKey.currentState!.validate()) {

                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      firstName: controller.firstName.text.trim(),
                      lastName: controller.lastName.text.trim(),
                      phoneNumber: controller.phoneNumber.text.trim(),
                      school: "Default...",
                      picture: "Default...",
                    );

                    SignUpController.instance.createUser(user);
                  }
                  -- */
                },
                child: const Text(tRequestScreenButtonText),
              ),
            )
          ],
        )
      ),
    );
  }


}