// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/navigation_menu.dart';
import 'package:cyclone/src/constants/colors.dart';
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

  late Future<List<dynamic>> _categoryListFuture;
  List<dynamic> _selectedVal = [];

 final NavigationController navigationController = Get.find();

 final controller = Get.put(RequestController());
 final controller2 = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _initializeCategoryList();
    controller.category.text = _selectedVal.toString();
  }

  Future<void> _initializeCategoryList() async {
    _categoryListFuture = ProfileController.instance.getAllCategories();
    final categories = await _categoryListFuture;
    setState(() {
      _selectedVal = categories;
    });
  }
  
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
                                    print(userData.id);

              return 
                   Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller.name,
                decoration: const InputDecoration(
                  label: Text(tName),
                  hintText: tName,
                ),
              ),
              const SizedBox(height: tFormHeight - 20,),
      
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller.brand,
                decoration: const InputDecoration(
                label: Text(tBrand),
                hintText: tBrand,
                ),
              ),
      
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller.year,
                decoration: const InputDecoration(
                label:Text(tYear),
                hintText: tYear,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
      
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller.location,
                decoration: const InputDecoration(
                label:Text(tLocation),
                hintText: tLocation,
                ),
              ),
              
              const SizedBox(height: tFormHeight - 20,),
      
                        DropdownButtonFormField(
                          value: _selectedVal.isNotEmpty ? _selectedVal[0] : _selectedVal[0],
                          items: _selectedVal.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedVal =[val!];
                              controller.category.text =  val.toString();
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: tPrimaryColor,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Select Category", 
                            border: OutlineInputBorder(),
                          ),
                        ),      

              const SizedBox(height: tFormHeight - 20,),

      
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
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
                      if (controller.name.text.isNotEmpty &&
                        controller.brand.text.isNotEmpty &&
                        controller.year.text.isNotEmpty &&
                        controller.location.text.isNotEmpty &&
                        controller.description.text.isNotEmpty &&
                        controller.category.text.isNotEmpty
                        ) {


                      final user = RequestModel(
                        userid: controller2.getID(),
                        name: controller.name.text.trim(), 
                        description: controller.description.text.trim(), 
                        brand: controller.brand.text.trim(), 
                        year: controller.year.text.trim(), 
                        location: controller.location.text.trim(), 
                        category: controller.category.text.trim(),
                      );

                      RequestController.instance.addRequest(user);

                              controller.name.clear();
                              controller.brand.clear();
                              controller.year.clear();
                              controller.location.clear();
                              controller.description.clear();
                              controller.category.clear();

                      Future.delayed(const Duration(seconds: 3), () {
                        navigationController.selectedIndex.value = 0;
                      });

                    } else {
        // Handle case where not all fields are filled
                      Get.snackbar(
                        "Error",
                        "Please fill all the fields",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.redAccent.withOpacity(0.3),
                        colorText: Colors.red,
                        duration: const Duration(seconds: 7),
                      );
                    }
                  }
                  },
                  child: const Text(tRequestScreenButtonText),

                )
              )
            ],
          )
        );
            } else if (snapshot.hasError) {
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