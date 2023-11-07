import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;

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

            const Text("$tOtpMessage CloudOTP@cocycle.com, to your Phone Number", textAlign: TextAlign.center,),

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
                OTPController.instance.verifyOTP(otp);
              },
            ),

            const SizedBox(height: tFormHeight - 10,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
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