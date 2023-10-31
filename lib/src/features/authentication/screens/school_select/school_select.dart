import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/core/screens/home/home.dart';
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

  final _schoolList = ["KENYON COLLEGE", "KNUST"];
  String? _selectedVal = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tSelectSchoolTitle, style: Theme.of(context).textTheme.displayLarge),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Form(
                  child: Column(
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const HomeScreen());
                  },
                  child: const Text(tSelectSchoolButtonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
