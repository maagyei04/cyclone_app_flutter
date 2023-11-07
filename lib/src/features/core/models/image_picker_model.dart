import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileImageModel {
  final String? id;
  final String picture;



  const ProfileImageModel({
    this.id,
    required this.picture,

  });

  toJson() {
    return {
      "Picture": picture,
    };
  }

  factory ProfileImageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    final id = document.id;
    return ProfileImageModel(
      id: id,
      picture: data?["Picture"]
    );
  } 
}