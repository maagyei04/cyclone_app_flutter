import 'package:cyclone/src/commom_widgets/form/form_header_widget.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/screens/Login/login_screen.dart';
import 'package:cyclone/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 15),
            child: Column(
              children: [
                 const FormHeaderWidget(
                  image: tAppLogoImage, 
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                const SignUpFormWidget(),
                Column(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}