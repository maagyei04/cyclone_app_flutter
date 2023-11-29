import 'package:cyclone/src/commom_widgets/categories/vertical_categories.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:cyclone/src/features/core/screens/home/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRequestsPost extends StatelessWidget {
  const TRequestsPost({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());


    return Container(
     padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<List<RequestModel>>(
        future: controller.getAllRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return 
                 ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length, 
                    itemBuilder: (c, index) {
                      return Column(
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
                                                  const CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundImage: AssetImage(tOnBoardingImage2), // Replace with your image
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(snapshot.data![index].name, style: Theme.of(context).textTheme.labelMedium,),
                                                      Text(snapshot.data![index].location, style: Theme.of(context).textTheme.bodySmall,),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                                              
                                            ],
                                          ),
                                          const SizedBox(height: 12.0),
                                          Text(
                                            snapshot.data![index].description, 
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
                                                    child: Text(snapshot.data![index].brand, 
                                                    style: Theme.of(context).textTheme.displaySmall,
                                                    )),
                                                          
                                                    const SizedBox(width: 10.0,),
                                                          
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color.fromARGB(255, 254, 167, 196), 
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),                                                  
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Text(snapshot.data![index].year, 
                                                    style: Theme.of(context).textTheme.displaySmall,
                                                    )),
                                                ],
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.send, color: tPrimaryColor,),
                                                onPressed: () {
                                                  // Add onPressed functionality here
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                       
                        
                          const SizedBox(height: 15,),

                          GestureDetector(
                              onTap: () {
                                Get.to(() => const DetailScreen(), arguments: snapshot.data![index]);
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
                                                    const CircleAvatar(
                                                      radius: 20.0,
                                                      backgroundImage: AssetImage(tOnBoardingImage2), // Replace with your image
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(snapshot.data![index].name, style: Theme.of(context).textTheme.labelMedium,),
                                                        Text(snapshot.data![index].location, style: Theme.of(context).textTheme.bodySmall,),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                                
                                              ],
                                            ),
                                            const SizedBox(height: 12.0),
                          
                                            const Image(image: AssetImage(tOnBoardingImage2), fit: BoxFit.fill, height: 300.0,),
                          
                                            const SizedBox(height: 12.0),
                                            Text(
                                              snapshot.data![index].name, 
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
                                                      child: Text(snapshot.data![index].brand, 
                                                      style: Theme.of(context).textTheme.displaySmall,
                                                      )),
                                                            
                                                      const SizedBox(width: 10.0,),
                                                            
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color.fromARGB(255, 254, 167, 196), 
                                                        borderRadius: BorderRadius.circular(20.0),
                                                      ),                                                  
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Text(snapshot.data![index].year, 
                                                      style: Theme.of(context).textTheme.displaySmall,
                                                      )),
                                                  ],
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.send, color: tPrimaryColor,),
                                                  onPressed: () {
                                                    // Add onPressed functionality here
                                                  },
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 15,),

                        ],
                      );
                      
                    });
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
    );
  }
}

    