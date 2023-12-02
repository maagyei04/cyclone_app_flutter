// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/models/image_picker_model.dart';
import 'package:cyclone/src/features/core/models/post_model.dart';
import 'package:cyclone/src/features/core/models/request_model.dart';
import 'package:cyclone/src/features/core/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cyclone/src/features/authentication/models/school_model.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final controller = Get.put(ImagePickerController());

  final _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<bool> doesPhoneNumberExist(String phoneNumber) async {
    try {
      final querySnapshot = await _db
          .collection('Users')
          .where('Phone', isEqualTo: phoneNumber)
          .get();

        print (querySnapshot.docs.isNotEmpty);
      return querySnapshot.docs.isNotEmpty;

    } catch (e) {
      // Handle any errors in database query
      print('Error checking phone number existence: $e');
      return false;
    }
  }   

   Future<DocumentReference> createUser(UserModel user) async {
    try {
      final result = await _db.collection("Users").add(user.toJson());
      Get.snackbar(
        'Success',
        'Your account has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
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

  Future<List<dynamic>> allCategories() async {
    List<dynamic> categories = [];

    try {
      // Access the Firestore instance
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('Categories').get();

      if (snapshot.docs.isNotEmpty) {
        var categoryData = snapshot.docs.first.data()['category'];
        print('Category Data: $categoryData'); // Check what's fetched

        if (categoryData is List<dynamic>) {
          categories = categoryData;
          print('Categories: $categories'); // Check parsed categories
        }
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }

    return categories;
  }

  Future<List<PostModel>> allPosts() async {
    final snapshot = await _db.collection("Posts").get();
    final userData = snapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList();
    
    for (QueryDocumentSnapshot requestDoc in snapshot.docs) {
      String userId = requestDoc['UserId'];

      DocumentSnapshot userSnapshot = await _db.collection("Users").doc(userId).get();

      if (userSnapshot.exists) {
       Map<String, dynamic> userData1 = userSnapshot.data() as Map<String, dynamic>;

        print('user info for UserID $userId: $userData1');

        String userName = userData1["FirstName"] ?? 'Unknown';

        print('User name: $userName'); 
      } else {
        print('User with UserID $userId does not exist.');
      }

      var postData = requestDoc.data();
      print('Post data: $postData');
    }
    return userData;
  }


  Future<List<RequestModel>> allRequests() async {
    final snapshot = await _db.collection("Requests").get();
    final userData = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    
    for (QueryDocumentSnapshot requestDoc in snapshot.docs) {
      String userId = requestDoc['UserId'];

      DocumentSnapshot userSnapshot = await _db.collection("Users").doc(userId).get();

      if (userSnapshot.exists) {
       Map<String, dynamic> userData1 = userSnapshot.data() as Map<String, dynamic>;

        print('user info for UserID $userId: $userData1');

        String userName = userData1["FirstName"] ?? 'Unknown';

        print('User name: $userName'); 
      } else {
        print('User with UserID $userId does not exist.');
      }

      var postData = requestDoc.data();
      print('Post data: $postData');
    }
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

   Future<DocumentReference> addUserRequest(RequestModel user) async {
    try {
      final result = await _db.collection("Requests").add(user.toJson());
      Get.snackbar(
        'Success',
        'Your request has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      print("ERROR: $error");
      rethrow;
    }
  }

  Future<DocumentReference> addUserPost(PostModel user) async {
    try {
      final result = await _db.collection("Posts").add(user.toJson());
      Get.snackbar(
        'Success',
        'Your post has been successfully created.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.green,
        duration: const Duration(seconds: 5),
      );
      return result; // Return the DocumentReference
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
      print("ERROR: $error");
      rethrow;
    }
  }

  Future<String> uploadProfileImage() async {
    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.png';

    try {
      Reference ref = _storage.ref().child('profileImage/$fileName');

UploadTask uploadTask = ref.putFile(controller.image.value);
        TaskSnapshot snapshot = await uploadTask;
       String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> uploadPostImage() async {
    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(10000)}.png';


    try {
      Reference ref = _storage.ref().child('postImages/$fileName');

      UploadTask uploadTask = ref.putFile(controller.image.value);

      print(controller.image.value);

      TaskSnapshot snapshot = await uploadTask;
       String downloadUrl =  await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        "Something went wrong. Try Again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );
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
  

  Future<void> deleteUserByPhoneNumber(String phoneNumber) async {

  CollectionReference users = _db.collection('Users');

  QuerySnapshot querySnapshot = await users.where('Phone', isEqualTo: phoneNumber).get();

  for (QueryDocumentSnapshot<Object?> doc in querySnapshot.docs) {
    await doc.reference.delete();
  }

}

}  