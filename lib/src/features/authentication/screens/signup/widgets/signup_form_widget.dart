import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/signup_controller.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                      label: Text(tFirstName),
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
                const SizedBox(width: tFormHeight - 20,),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    decoration: const InputDecoration(
                      label: Text(tLastName),
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: tFormHeight - 20,),

            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
              label: Text(tPhoneNumber),
              hintText: tPhoneNumberHint,
              prefixIcon: Icon(Icons.phone_android_outlined),
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
              label:Text(tEmail),
              hintText: tEmailHint,
              prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
              label: Text(tPassword),
              prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    /* ---- sign in via email method
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(), 
                      controller.password.text.trim(),
                    );
                    ---- */

                    /* --
                    SignUpController.instance.phoneAuthentication(
                      controller.phoneNumber.text.trim()
                    );
                    Get.to(() => const OTPScreen());
                    -- */

                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      firstName: controller.firstName.text.trim(),
                      lastName: controller.lastName.text.trim(),
                      phoneNumber: controller.phoneNumber.text.trim(),
                      school: "Default...",
                    );

                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        )
      ),
    );
  }
}