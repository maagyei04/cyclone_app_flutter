import 'package:cloud_firestore/cloud_firestore.dart';


class RequestModel {
  final String? id;
  final String userid;
  final String name;
  final String description;
  final String brand;
  final String year;
  final String location;
  final DateTime? timestamp;




  const RequestModel({
    required this.userid,
    required this.name, 
    required this.description, 
    required this.brand, 
    required this.year, 
    required this.location,
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
      'TimeStamp': FieldValue.serverTimestamp(),
    };
  }

  factory RequestModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    final id = document.id;
    return RequestModel(
      id: id,
      userid: data?['UserId'], 
      name: data?['Name'], 
      description: data?['Description'], 
      brand: data?['Brand'], 
      year: data?['Year'], 
      location: data?['Location'], 
      timestamp: (data?['TimeStamp'] as Timestamp).toDate(),
    );
  } 
}