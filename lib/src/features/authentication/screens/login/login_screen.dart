import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:cyclone/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:cyclone/src/features/authentication/screens/login/widgets/login_header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                const LoginForm(),
                const LoginFooterWidget()
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}