import 'package:cloud_firestore/cloud_firestore.dart';


class PostModel {
  final String? id;
  final String userid;
  final String name;
  final String description;
  final String brand;
  final String year;
  final String location;
  final String photo;
  final DateTime? timestamp;




  const PostModel({
    required this.userid,
    required this.name, 
    required this.description, 
    required this.brand, 
    required this.year, 
    required this.location,
    required this.photo,
    this.id,
    this.timestamp,

  });

  toJson() {
    return {
      'UserId': userid,
      'Name': name,
      'Description': description,
      'Brand': brand,
      'Year': year,
      'Location': location,
      'Photo': photo,
      'TimeStamp': FieldValue.serverTimestamp(),
    };
  }

  factory PostModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    final id = document.id;
    return PostModel(
      id: id,
      userid: data?['UserId'], 
      name: data?['Name'], 
      description: data?['Description'], 
      brand: data?['Brand'], 
      year: data?['Year'], 
      location: data?['Location'], 
      photo: data?['Photo'],
      timestamp: (data?['TimeStamp'] as Timestamp).toDate(),
    );
  } 
}