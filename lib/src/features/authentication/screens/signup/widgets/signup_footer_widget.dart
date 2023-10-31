import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0,), 
            label: const Text(tSignInWithGoogle),
          ),
        ),
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: Text.rich(TextSpan(
            children: [
              TextSpan(text: tAlreadyHaveAnAccount, 
              style: Theme.of(context).textTheme.bodySmall),
              const TextSpan(text: tLogin),
            ]
          )),
        )
      ],
    );
  }
}