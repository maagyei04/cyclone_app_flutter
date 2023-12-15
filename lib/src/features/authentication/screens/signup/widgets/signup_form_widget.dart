// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/signup_controller.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';


class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  /* --
  String initialCountry = 'US';

  PhoneNumber number = PhoneNumber(isoCode: 'US');

  -- */
  final controller = Get.put(SignUpController());
 bool _isPasswordVisible = false;



  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

              InternationalPhoneNumberInput(
                height: 60,
                inputFormatters: const [],
                formatter: MaskedInputFormatter('000 000 0000'),
                initCountry: CountryCodeModel(
                    name: "United States", dial_code: "+1", code: "US"),
                betweenPadding: 15,
                onInputChanged: (number) {
                var fullNumber = '${number.dial_code} ${number.number}';
                fullNumber = fullNumber.replaceAll(' ', '');
                controller.phoneNumber.text = fullNumber;
                print(fullNumber);
                },
                dialogConfig: DialogConfig(
                  backgroundColor: const Color(0xFF444448),
                  searchBoxBackgroundColor: const Color(0xFF56565a),
                  searchBoxIconColor: tWhiteColor,
                  countryItemHeight: 55,
                  topBarColor: tWhiteColor,
                  selectedItemColor: const Color(0xFF56565a),
                  selectedIcon: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.phone_android_rounded,
                    )
                  ),
                  textStyle: TextStyle(
                      color: const Color(0xFFFAFAFA).withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  searchBoxTextStyle: TextStyle(
                      color: const Color(0xFFFAFAFA).withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  titleStyle: const TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  searchBoxHintStyle: TextStyle(
                      color: const Color(0xFFFAFAFA).withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                countryConfig: CountryConfig(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: const Color(0xFF3f4046)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    noFlag: false,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                phoneConfig: PhoneConfig(
                  focusedColor: tPrimaryColor,
                  enabledColor: tPrimaryColor,
                  radius: 8,
                  hintText: tPhoneNumber,
                  borderWidth: 2,
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
            ),

/* --
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
                trailingSpace: false,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: isDarkMode ? tWhiteColor : tDarkColor),
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
            -- */


                        const SizedBox(height: tFormHeight - 20,),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 15.0),
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
                    style: const TextStyle(fontSize: 15.0),
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
              style: const TextStyle(fontSize: 15.0),
              controller: controller.email,
              decoration: const InputDecoration(
              label:Text(tEmail),
              hintText: tEmailHint,
              prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              style: const TextStyle(fontSize: 15.0),
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
                    if (controller.email.text.isNotEmpty &&
                        controller.password.text.isNotEmpty &&
                        controller.firstName.text.isNotEmpty &&
                        controller.lastName.text.isNotEmpty &&
                        controller.phoneNumber.text.isNotEmpty
                      ) {

                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      firstName: controller.firstName.text.trim(),
                      lastName: controller.lastName.text.trim(),
                      phoneNumber: controller.phoneNumber.text.trim(),
                      school: "Default...",
                      picture: "Default...",
                    );

                    SignUpController.instance.registerUser(user);
                  } else {
                      // Handle case where not all fields are filled
                    Get.snackbar(
                      "Error",
                      "Please fill all the fields",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.redAccent.withOpacity(0.3),
                      colorText: Colors.red,
                      duration: const Duration(seconds: 7),
                    );
                  }
                }},
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        )
      ),
    );
  }

/* --
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
-- */


}