
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerificationScreen extends StatelessWidget {
  const MailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold( 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: tDefaultSize,),
              const Icon(LineAwesomeIcons.envelope_open, size: 100,),
                            const SizedBox(height: tDefaultSize,),

              Text(tEmailVTitle, style: Theme.of(context).textTheme.displayLarge,),
                            const SizedBox(height: tDefaultSize,),

              Text(tEmailVContent, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium),
                            const SizedBox(height: tDefaultSize,),

              Text(tEmailVSubTitle, textAlign: TextAlign.center,  style: Theme.of(context).textTheme.displayMedium),
                            const SizedBox(height: tDefaultSize,),

              SizedBox(
                width: 200,
                child: OutlinedButton(onPressed: () => controller.manuallyCheckEmailVerificationStatus(), child: const Text(tContinue)),
              ),
                            const SizedBox(height: tDefaultSize,),

              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(tEmailVResend, style: Theme.of(context).textTheme.labelMedium)
              ),
                            const SizedBox(height: tDefaultSize,),

              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout(), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LineAwesomeIcons.alternate_long_arrow_left),
                    const SizedBox(width: 5,),
                    Text(tBackToLogin.toLowerCase(), style: Theme.of(context).textTheme.labelMedium),
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}