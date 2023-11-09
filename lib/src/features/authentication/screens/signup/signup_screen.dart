import 'package:cyclone/src/commom_widgets/form/form_header_widget.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:cyclone/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 15),
            child: const Column(
              children: [
                 FormHeaderWidget(
                  image: tAppLogoImage, 
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SignUpFormWidget(),

                SignUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}