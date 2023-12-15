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

  factory UserModel.fromSnapshot(DocumentSnapshot<Object?> document) {
  final data = document.data() as Map<String, dynamic>?;

  if (data != null) {
    return UserModel(
      id: document.id,
      firstName: data["FirstName"] ?? '', 
      lastName: data["LastName"] ?? '', 
      email: data["Email"] ?? '',
      password: data["Password"] ?? '', 
      phoneNumber: data["Phone"] ?? '',
      school: data["School"] ?? '',
      picture: data["Picture"] ?? '',
    );
  }

  // If data is null or empty, return default UserModel or handle accordingly
  return const UserModel(school: '', firstName: '', lastName: '', email: '', password: '', phoneNumber: '', picture: ''); // Create a default UserModel or handle null case
}
 
}