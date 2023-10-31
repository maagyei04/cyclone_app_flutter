import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(tSelectSchoolTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home"),
            const Text("Yet To Build The HomeScreen, #Michan"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
              child: const Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}