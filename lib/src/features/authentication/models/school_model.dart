import 'package:cloud_firestore/cloud_firestore.dart';


class SchoolModel {
  final String? id;
  final String school;



  const SchoolModel({
    this.id,
    required this.school,

  });

  toJson() {
    return {
      "School": school,
    };
  }

  factory SchoolModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    final id = document.id;
    return SchoolModel(
      id: id,
      school: data?["School"]
    );
  } 
}