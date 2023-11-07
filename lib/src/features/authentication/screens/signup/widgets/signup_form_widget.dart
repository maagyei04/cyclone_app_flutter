// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/signup_controller.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  String initialCountry = 'GH';

  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  final controller = Get.put(SignUpController());
 bool _isPasswordVisible = false;



  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
                    // Get the raw phone number from number.phoneNumber
                final rawPhoneNumber = number.phoneNumber;

                // Update your controller with the raw phone number
                controller.phoneNumber.text = rawPhoneNumber!;
                print(rawPhoneNumber);
              },
              onInputValidated: (bool value) {
                print(value); 
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: number,
              formatInput: true,
              keyboardType:
                  const TextInputType.numberWithOptions(signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
              inputDecoration: const InputDecoration(
                      label: Text(tPhoneNumber),
                      prefixIcon: Icon(Icons.phone_android_rounded),
              ),
            ),


                        const SizedBox(height: tFormHeight - 20,),

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
            /* --
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
              label: Text(tPhoneNumber),
              hintText: tPhoneNumberHint,
              prefixIcon: Icon(Icons.phone_android_outlined),
              ),
            ),
            -- */
                      
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
              obscureText: !_isPasswordVisible,
              controller: controller.password,
              decoration: InputDecoration(
              label: const Text(tPassword),
              prefixIcon: const Icon(Icons.fingerprint),
              suffixIcon: IconButton(
                    icon: _isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });             
              })
              
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
                      picture: "Default...",
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

 void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    String parsableNumber = await PhoneNumber.getParsableNumber(number);
    controller.phoneNumber.text = parsableNumber;

    setState(() {
      initialCountry = number.isoCode!;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



}