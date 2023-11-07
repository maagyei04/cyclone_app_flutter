import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginOTPScreen extends StatelessWidget {
  const LoginOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(LoginController());
    String otp;

    return Scaffold(
      body: Container( 
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tOtpTitle, style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0,
            ),),
            Text(tOtpSubTitle, style: Theme.of(context).textTheme.displayMedium,),

            const SizedBox(height: tFormHeight + 10,),

            const Text("$tOtpMessage CloudOTP@cocycle.com", textAlign: TextAlign.center,),

            const SizedBox(height: tFormHeight - 10,),

            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              enabledBorderColor: tPrimaryColor,
              focusedBorderColor: tPrimaryColor,
              onSubmit: (code) {
                otp = code;
                LoginController.instance.verifyOTPLogin(otp);
              },
            ),

            const SizedBox(height: tFormHeight - 10,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  LoginController.instance.verifyOTPLogin(otp);
                }, 
                child: const Text(tNext),
              ),
            )
          ],
        ),
      ),
    );
  }
}