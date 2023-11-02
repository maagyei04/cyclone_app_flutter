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
            label: Text(tSignInWithGoogle, style: Theme.of(context).textTheme.displayMedium,),
          ),
        ),
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()),
          child: Text.rich(
          TextSpan(
            text: tAlreadyHaveAnAccount,
            style: Theme.of(context).textTheme.bodySmall,
            children: const [
              TextSpan(
                text: tLogin,
                style: TextStyle(
                  color: Colors.blue,
                )
              ),
            ]
          )             
        ),
        )
      ],
    );
  }
}