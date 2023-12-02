
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController {

  Rx<File> image = File('').obs;

  Future pickImage() async {
    
    try {
      
      final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagePick == null) {
        print("Image is null");
        return;
      }

      final imageTmp = File(imagePick.path);

      image.value = imageTmp; 
      print(image.value);
    } on PlatformException catch (e) {
      print("Error: $e");
      print(image.value);
    }

  }

  Future pickImageCamera() async {
    
    try {
      
      final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);

      if (imagePick == null) {
        print("Image is null");
        return;
      }

      final imageTmp = File(imagePick.path);

      image.value = imageTmp; 
      print(image.value);
    } on PlatformException catch (e) {
      print("Error: $e");
      print(image.value);
    }

  }

}