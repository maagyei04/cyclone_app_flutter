// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/login_controller.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_modal_buttom_sheet.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_otp/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
  
}

class _LoginFormState extends State<LoginForm> {
 bool _isPasswordVisible = false;

  /* --
  String initialCountry = 'US';

  PhoneNumber number = PhoneNumber(isoCode: 'US');
  -- */

  final controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              style: const TextStyle(fontSize: 15.0),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmailHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              style: const TextStyle(fontSize: 15.0),
              obscureText: !_isPasswordVisible,
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: IconButton(
                      icon: _isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });             
                })
              ),
              
            ),

            /* --
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_android_outlined),
                labelText: tPhoneNumber,
                hintText: tPhoneNumberHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: tFormHeight - 20,),


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
                         -- */   
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
                trailingSpace: false,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: isDarkMode ? tWhiteColor : tDarkColor),
              initialValue: number,
              formatInput: true,
              keyboardType:
                  const TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
          -- */

            const SizedBox(height: tFormHeight - 20,),


            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgotPassword, style: TextStyle(fontSize: 12.0),),
              ),
            ),
            const SizedBox(height: 10.0,),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  /* --
                  if(formKey.currentState!.validate()) {
                    LoginController.instance.loginUser(
                      controller.email.text.trim(), 
                      controller.password.text.trim(),
                    );
                  },
                  -- */
                  if(formKey.currentState!.validate()) {
                    LoginController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                  }                       
                }, 
                child: Text(tLogin.toUpperCase()),
              ),
            )
          ],
        ),
      )
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