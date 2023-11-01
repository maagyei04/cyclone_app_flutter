import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolModel {
  final String? id;
  final String? school;



  const SchoolModel({
    this.id,
    this.school,

  });

  toJson() {
    return {
      "School": school,
    };
  }

  factory SchoolModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return SchoolModel(
      id: document.id,
      school: data?["School"]
    );
  } 
}