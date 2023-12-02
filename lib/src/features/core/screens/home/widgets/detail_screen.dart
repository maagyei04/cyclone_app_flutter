import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                                            CachedNetworkImage(
                                              imageUrl: data.photo,
                                              placeholder: (context, url) => const CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              width: size.width, height: size.height * 0.45, fit: BoxFit.fill,
                                            ),                 
                Positioned(
                  top: 20, // Adjust top padding as needed
                  left: 10, // Adjust left padding as needed
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                ]
                 ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                                   const SizedBox(height: 10.0,),
                Text('Account Details', style: Theme.of(context).textTheme.headlineLarge,),
                const Divider(color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage(tOnBoardingImage2), // Replace with your image
                            ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name, style: Theme.of(context).textTheme.labelMedium,),
                              Text(data.location, style: Theme.of(context).textTheme.bodySmall,),
                            ],
                          ),
      
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
                                   const SizedBox(height: 15.0,),
                Text('Product Details', style: Theme.of(context).textTheme.headlineLarge,),
                const Divider(color: Colors.grey,),     
                                   const SizedBox(height: 5.0,),
                Text(data.name, style: Theme.of(context).textTheme.headlineMedium,),
                                   const SizedBox(height: 10.0,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromARGB(255, 229, 142, 249), 
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(data.brand, 
                                                        style: Theme.of(context).textTheme.displaySmall,
                                                        )),
                                                              
                                                        const SizedBox(width: 10.0,),
                                                              
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromARGB(255, 254, 167, 196), 
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),                                                  
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(data.year, 
                                                        style: Theme.of(context).textTheme.displaySmall,
                                                        )),
                                                    ],
                                                  ),
                                   const SizedBox(height: 10.0,),
                                   Text(data.description, style: Theme.of(context).textTheme.displaySmall,),
                                                                               
           
                   ],
                 ),
      
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(onPressed: (){}, child: const Text('Make A Request')),
                                                  ),
      )   ,
    );
  }
}