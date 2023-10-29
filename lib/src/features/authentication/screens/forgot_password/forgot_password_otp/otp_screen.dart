import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            const Text("$tOtpMessage support@cocycle.com", textAlign: TextAlign.center,),

            const SizedBox(height: tFormHeight - 10,),

            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              // ignore: avoid_print
              onSubmit: (code) {print("OTP is => $code");},
            ),

            const SizedBox(height: tFormHeight - 10,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, 
                child: const Text(tNext),
              ),
            )
          ],
        ),
      ),
    );
  }
}