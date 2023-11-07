import 'package:cyclone/firebase_options.dart';
import 'package:cyclone/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:cyclone/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: 
    DefaultFirebaseOptions.currentPlatform, 
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const OnBoardingScreen(),
      );
  }
}