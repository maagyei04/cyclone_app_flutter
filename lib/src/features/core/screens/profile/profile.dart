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
        padding: const EdgeInsets.all(tDefaultSize - 15),
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                return 

                
                SingleChildScrollView(
                  child: Column(
                    
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Background color of the main container
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color.fromARGB(255, 125, 125, 125),
                                width: 1,
                              ), // Rounded corners
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(tOnBoardingImage1), // Add your image here
                                        radius: 30, // Radius of the circular image
                                      ),
                                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                                    ],
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(userData.firstName, style: Theme.of(context).textTheme.headlineLarge,),
                                      const SizedBox(width: 10.0,),
                                      Text(userData.lastName, style: Theme.of(context).textTheme.headlineLarge,),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0,),
                                  Row(
                                    children: [
                                      const Icon(Icons.home),
                                      Text(userData.school, style: Theme.of(context).textTheme.bodySmall,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            
                          ),
                  const SizedBox(height: 20.0,),
                
                  Text('My Account', style: Theme.of(context).textTheme.displayLarge,),

                  const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Personal Details', style: Theme.of(context).textTheme.displayMedium,),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                
                  const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Donations', style: Theme.of(context).textTheme.displayMedium,),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                
                  const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Requests', style: Theme.of(context).textTheme.displayMedium,),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),                
                
                  const SizedBox(height: 20.0,),
                
                
                
                  Text('App Support', style: Theme.of(context).textTheme.displayLarge,),
                
                              const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Help & Support', style: Theme.of(context).textTheme.displayMedium,),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ), 
                
                              const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Submit Feedback', style: Theme.of(context).textTheme.displayMedium,),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ), 
                
                              const SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () {
                      AuthenticationRepository.instance.logout();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Log Out', style: Theme.of(context).textTheme.displayMedium,),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ), 
                
                              const SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:Border.all(
                        color: Colors.red,
                        width: 1.0,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delete Account', style: Theme.of(context).textTheme.displayMedium,),
                       const  Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ), 
                
                              ],
                            ),
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