// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyclone/src/commom_widgets/categories/vertical_categories.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/models/post_model.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:cyclone/src/features/core/screens/chat/chat.dart';
import 'package:cyclone/src/features/core/screens/home/widgets/detail_screen.dart';
import 'package:cyclone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRequestsPost extends StatelessWidget {
  const TRequestsPost({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final controller2 = Get.put(AuthenticationRepository());


    var userId = controller2.getUserID;

    return Container(
     padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<List<Map<String, dynamic>>>(
  future: controller.getAllRequests(),
  builder: (context, snapshot1) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controller.getAllPosts(),
      builder: (context, snapshot2) {
        if (snapshot1.connectionState == ConnectionState.done &&
            snapshot2.connectionState == ConnectionState.done) {
          if (snapshot1.hasData && snapshot2.hasData) {
            // Merge the data from both snapshots in the desired order
            print(snapshot1.data);
            print(snapshot2.data);
            List<Widget> mergedList = [];
            for (int i = 0; i < snapshot1.data!.length; i++) {

              Map<String, dynamic>? combinedData = snapshot1.data![i];

            Map<String, dynamic>? userData = combinedData['userData'];
            Map<String, dynamic>? requestData = combinedData['requestData'];              
            mergedList.add(
                Column(
                        children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                    color: Colors.grey, // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                    padding: const EdgeInsets.all(15.0),
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundImage: NetworkImage(userData?['Picture']), // Replace with your image
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                            Row(
                                                              children: [
                                                                Text(userData?['FirstName'] ?? 'test', style: Theme.of(context).textTheme.labelMedium,),
                                                                  const SizedBox(width: 5.0,),
                                                                Text(userData?['LastName'] ?? 'test', style: Theme.of(context).textTheme.labelMedium,),
                                                              ]
                                                            ),                                                      
                                                            Text(requestData?["Location"] ?? 'test', style: Theme.of(context).textTheme.bodySmall,),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                                              
                                            ],
                                          ),
                                          const SizedBox(height: 12.0),
                                          Text(
                                            requestData?['Description'] ?? 'test', 
                                            style: Theme.of(context).textTheme.labelMedium,
                                            softWrap: true,
                                          ),
                                          const SizedBox(height: 12.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color.fromARGB(255, 229, 142, 249), 
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Text(requestData?['Brand'] ?? 'test', 
                                                    style: Theme.of(context).textTheme.displaySmall,
                                                    )),
                                                          
                                                    const SizedBox(width: 10.0,),
                                                          
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color.fromARGB(255, 254, 167, 196), 
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),                                                  
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Text(requestData?['Year'] ?? 'test', 
                                                    style: Theme.of(context).textTheme.displaySmall,
                                                    )),
                                                ],
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.send, color: tPrimaryColor,),
                                                onPressed: () {
                                                  Get.to(() => ChatScreen(userId: userId));
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 15.0,)

                        ],
                      ),
              );
              if (i < snapshot2.data!.length) {
                Map<String, dynamic>? combinedData = snapshot2.data![i];

                Map<String, dynamic>? userData = combinedData['userData'];
                Map<String, dynamic>? postData = combinedData['postData']; 
                mergedList.add(
                  Column(
                    children: [
                      GestureDetector(
                                  onTap: () {
                                    Get.to(() => const DetailScreen(), arguments: snapshot2.data![i]);
                                  },                            
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: Colors.grey, // Border color
                                          width: 1.0, // Border width
                                        ),
                                      ),
                                          padding: const EdgeInsets.all(15.0),
                                          child: IntrinsicHeight(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 20.0,
                                                          backgroundImage: NetworkImage(userData?['Picture']), // Replace with your image
                                                        ),
                                                        const SizedBox(width: 10.0),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row( 
                                                              children: [
                                                                Text(userData?['FirstName'] ?? 'test', style: Theme.of(context).textTheme.labelMedium,),
                                                                  const SizedBox(width: 5.0,),
                                                                Text(userData?['LastName'] ?? 'test', style: Theme.of(context).textTheme.labelMedium,),
                                                              ]
                                                            ),
                                                            Text(postData?['Location'] ?? 'test', style: Theme.of(context).textTheme.bodySmall,),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                                    
                                                  ],
                                                ),
                                                const SizedBox(height: 12.0),
                                                
                                                CachedNetworkImage(
                                                  imageUrl: postData?['Photo'] ?? 'test',
                                                  placeholder: (context, url) => const CircularProgressIndicator(color: tPrimaryColor,),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                ),
                              
                                                const SizedBox(height: 12.0),
                                                Text(
                                                  postData?['Name'] ?? 'test', 
                                                  style: Theme.of(context).textTheme.labelMedium,
                                                  softWrap: true,
                                                ),
                                                const SizedBox(height: 12.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: const Color.fromARGB(255, 229, 142, 249), 
                                                            borderRadius: BorderRadius.circular(20.0),
                                                          ),
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Text(postData?['Brand'] ?? 'test', 
                                                          style: Theme.of(context).textTheme.displaySmall,
                                                          )),
                                                                
                                                          const SizedBox(width: 10.0,),
                                                                
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: const Color.fromARGB(255, 254, 167, 196), 
                                                            borderRadius: BorderRadius.circular(20.0),
                                                          ),                                                  
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Text(postData?['Year'] ?? 'test', 
                                                          style: Theme.of(context).textTheme.displaySmall,
                                                          )),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons.send, color: tPrimaryColor,),
                                                      onPressed: () {
                                                        Get.to(() => ChatScreen(userId: userId));
                                                      },
                                                    ),

                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        
                              ),

                               const SizedBox(height: 15.0,)
                    ],
                  ),

                          
                );
              }
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: mergedList.length,
              itemBuilder: (context, index) {
                return mergedList[index];
              },
            );
          } else if (snapshot1.hasError) {
            print(snapshot1.error.toString());
          } else if (snapshot2.hasError) {
            print(snapshot2.error.toString());
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: tPrimaryColor,
            ),
          );
        }
        return const Text('Check your internet connection');
      },
    );
  },
), 

);

}

}