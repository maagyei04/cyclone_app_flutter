// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/models/image_picker_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cyclone/src/features/authentication/models/school_model.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final controller = Get.put(ImagePickerController());

  final _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

   Future<DocumentReference> createUser(UserModel user) async {
    try {
      final result = await _db.collection("Users").add(user.toJson());
      Get.snackbar(
        'Success',
        'Your account has been successfully created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      print("ERROR: $error");
      rethrow;
    }
  }

  Future<UserModel> getUserDetails(String phoneNumber) async {
    final snapshot = await _db.collection("Users")
      .where("Phone", isEqualTo: phoneNumber)
        .get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<void> updateUserRecordSchool(SchoolModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson()).then((_) {
    print('New data added to the user document successfully.');
  })
  .catchError((error) {
        print(user.id);
        print(user.toJson());
    print('Error adding new data: $error');
  });
  }

  Future<String> uploadProfileImage() async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();

    try {
      Reference ref = _storage.ref().child('profileImage/$fileName.png');

      UploadTask uploadTask = ref.putFile(controller.image.value);

        TaskSnapshot snapshot = await uploadTask;
       String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> saveProfileImage(ProfileImageModel user) async {
    String resp = "Some error occurred";
    
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
      resp = 'success';
    } catch (e) {
      print(e);
    }
    return resp; 
  }

}  