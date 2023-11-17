// ignore_for_file: avoid_print

import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/controllers/request_controller.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

 final controller = Get.put(RequestController());
 final controller2 = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight ),
      child: FutureBuilder(
        future: controller2.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              return 
                   Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              TextFormField(
                controller: controller.name,
                decoration: const InputDecoration(
                  label: Text(tName),
                  hintText: tName,
                ),
              ),
      
              const SizedBox(height: tFormHeight - 20,),
      
              TextFormField(
                controller: controller.brand,
                decoration: const InputDecoration(
                label: Text(tBrand),
                hintText: tBrand,
                ),
              ),
      
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.year,
                decoration: const InputDecoration(
                label:Text(tYear),
                hintText: tYear,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.location,
                decoration: const InputDecoration(
                label:Text(tLocation),
                hintText: tLocation,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                controller: controller.description,
                maxLines: 7,
                decoration: const InputDecoration(
                label:Text(tDescription),
                hintText: tDescription,
                ),
              ), 
              
              const SizedBox(height: tFormHeight,),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
      
                      final user = RequestModel(
                        id: userData.id,
                        userid: controller2.getID(),
                        name: controller.name.text.trim(), 
                        description: controller.description.text.trim(), 
                        brand: controller.brand.text.trim(), 
                        year: controller.year.text.trim(), 
                        location: controller.location.text.trim(),
      
                      );
      
                      RequestController.instance.addRequest(user);
                    }
      
                  },
                  child: const Text(tRequestScreenButtonText),
                ),
              )
            ],
          )
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
    );
  }


}