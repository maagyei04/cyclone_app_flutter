import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                return 

                
                Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                  
                        Container(
                          width: 335, // Width of the main container
                          height: 82, // Height of the main container
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Background color of the main container
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 125, 125, 125),
                              width: 1,
                            ), // Rounded corners
                          ),
                          child: const OverflowBox(
                            maxHeight: 180,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0, // Raise the circular image beyond the container
                                  left: -200,
                                  right: 0,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(tOnBoardingImage1), // Add your image here
                                      radius: 35, // Radius of the circular image
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          
                        ),
                              Center(child: Text("Yet To Build The Profile Screen, #Michan", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,)),
                              Column(
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(userData.firstName, style: Theme.of(context).textTheme.bodyMedium,),
                                    const SizedBox(width: 10.0,),
                                    Text(userData.lastName, style: Theme.of(context).textTheme.bodyMedium,),
                                  ],
                                ),
                                const SizedBox(height: tFormHeight,),
                                Text(userData.email, style: Theme.of(context).textTheme.bodyMedium,),
                                                                const SizedBox(height: tFormHeight,),
                                Text(userData.school, style: Theme.of(context).textTheme.bodyMedium,),
                                ],
                              ),
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
                          );
                          
              } else if (snapshot.hasError) {
                                  // ignore: avoid_print
                                  print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          },
        ),
            ),
    );
  }
}