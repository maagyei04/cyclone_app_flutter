import 'package:cloud_firestore/cloud_firestore.dart';


class MessageModel {
  final String message;
  final String messageId;
  final String senderId;
  final String recieverId;
  final DateTime timestamp;
  final bool seen;
  final String messageType;


  const MessageModel({
    required this.message,
    required this.messageId, 
    required this.senderId, 
    required this.recieverId, 
    required this.timestamp, 
    required this.seen,
    required this.messageType,
  });

  toJson() {
    return {
      'Message': message,
      'MessageId': messageId,
      'SenderId': senderId,
      'RecieverId': recieverId,
      'Seen': seen,
      'MessageType': messageType,
      'TimeStamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['Message'],
      messageId: map['MessageId'],
      senderId: map['SenderId'],
      recieverId: map['RecieverId'], 
      seen: map['Seen'] as bool,
      messageType: map['MessageType'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (map['TimeStamp'] as int),
      ),
    );
  }   

  factory MessageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return MessageModel(
      message: data?['Message'],
      messageId: data?['MessageId'],
      senderId: data?['SenderId'],
      recieverId: data?['RecieverId'], 
      seen: data?['Seen'] as bool,
      messageType: data?['MessageType'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (data?['TimeStamp'] as int),
      ),
    );
  } 
}