import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/school_model.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/screens/image_upload/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolSelectScreen extends StatefulWidget {
  const SchoolSelectScreen({super.key});

  @override
  State<SchoolSelectScreen> createState() => _SchoolSelectScreenState();
}

class _SchoolSelectScreenState extends State<SchoolSelectScreen> {
  _SchoolSelectScreenState() {
    _selectedVal = _schoolList[0];
  }

  final _schoolList = ["KENYON COLLEGE", "KNUST", "ANMTC", "UG", "HAVARD", "PENSA"];
  String? _selectedVal = "";
  final controller = Get.put(ProfileController());
   
  @override
  void initState() {
    super.initState();
    controller.school.text = _selectedVal ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tSelectSchoolTitle, style: Theme.of(context).textTheme.displayLarge),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;
                  return 
                           Column(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                        DropdownButtonFormField(
                          value: _selectedVal,
                          items: _schoolList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedVal = val as String;
                              controller.school.text = _selectedVal ?? "";
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: tPrimaryColor,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Select School", 
                            prefixIcon: Icon(
                              Icons.school_rounded,
                              color: tPrimaryColor,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
          
                                  const SizedBox(height: tFormHeight - 20,),
          
          
                                      SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final userData = SchoolModel (
                        id: user.id,
                        school: controller.school.text.trim(),
                      );
                      // ignore: avoid_print
                      print(controller.school.text.trim());
                      await controller.updateRecordsSchool(userData);
                      // ignore: avoid_print
                      print(_selectedVal);
          
                      Get.to(() => const ImageUploadScreen());
                    },
                    child: const Text(tSelectSchoolButtonText),
                  ),
                ),
                      ],
                    ),
                  ),
                ),
          
              ],
            );

                }
                else if (snapshot.hasError) {
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
      ),
    );
  }
}
