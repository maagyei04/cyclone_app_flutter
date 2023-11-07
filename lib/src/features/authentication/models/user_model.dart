import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String school;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String picture;


  const UserModel({
    this.id,
    required this.school,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.picture,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phoneNumber,
      "Password": password,
      "School": school,
      "Picture": picture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return UserModel(
      id: document.id,
      firstName: data?["FirstName"], 
      lastName: data?["LastName"], 
      email: data?["Email"], 
      password: data?["Password"], 
      phoneNumber: data?["Phone"],
      school: data?["School"],
      picture: data?["Picture"],
    );
  } 
}