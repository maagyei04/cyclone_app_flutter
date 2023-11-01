import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/school_model.dart';
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


  final _schoolList = ["KENYON COLLEGE", "KNUST", "UNMTC", "UG", "HAVARD", "PENSA"];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(ProfileController());

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        value: controller.school,
                        items: _schoolList.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            controller.school;
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
                    // ignore: avoid_print
                    print(controller.school);
                    // ignore: avoid_print
                    print(controller.school.text.trim());
                    final userData = SchoolModel(
                      school: controller.school.text.trim(),
                    );

                    await controller.updateRecordsSchool(userData);
                  },
                  child: const Text(tSelectSchoolButtonText),
                ),
              ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
