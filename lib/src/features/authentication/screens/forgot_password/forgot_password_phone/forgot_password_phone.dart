import 'package:cyclone/src/commom_widgets/form/form_header_widget.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: tDefaultSize * 4,),
              const FormHeaderWidget(
                image: tForgetPasswordImage1, 
                title: tForgotPassword, 
                subTitle: tForgotPhoneSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: tFormHeight,
                textAlign: TextAlign.center,
              ),
      
              const SizedBox(height: tFormHeight,),
      
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tPhoneNumber),
                        hintText: tPhoneNumber,
                        prefixIcon: Icon(Icons.mobile_friendly_rounded),
                      ),
                    ),

                    const SizedBox(height:  tFormHeight - 10,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const OTPScreen());
                        },
                        child: const Text(tNext),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}