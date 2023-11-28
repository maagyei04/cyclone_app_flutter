import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryModel {
  final List<String> category;



  const CategoryModel({
    required this.category,

  });

  toJson() {
    return {
      "Category": List<String>.from(category),
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return CategoryModel(
      category: List<String>.from(data?["Category"]),
    );
  } 
}