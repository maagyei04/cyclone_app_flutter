import 'package:cloud_firestore/cloud_firestore.dart';


class ChatroomModel {
  final String chatroomId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final List<String> members;
  final DateTime createdAt;




  const ChatroomModel({
    required this.chatroomId,
    required this.lastMessage, 
    required this.lastMessageTs, 
    required this.members, 
    required this.createdAt, 
  });

  toJson() {
    return {
      'ChatroomId': chatroomId,
      'LastMessage': lastMessage,
      'LastMessageTs': lastMessageTs.millisecondsSinceEpoch,
      'Members': List<String>.from(members),
      'CreatedAt': createdAt.microsecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    return 'ChatroomModel(chatroomId: $chatroomId, lastMessage: $lastMessage, LastMessageTs: $lastMessageTs, Members: $members, CreatedAt: $createdAt, ...)';
  }

  factory ChatroomModel.fromMap(Map<String, dynamic> map) {
    return ChatroomModel(
      chatroomId: map['ChatroomId'] as String,
      lastMessage: map['LastMessage'] as String, 
      lastMessageTs: DateTime.fromMillisecondsSinceEpoch(
        (map['LastMessageTs'] as int),
      ),
      members: List<String>.from(map["Members"] as List), 
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (map['CreatedAt'] as int)
      ),
    );
  }

  factory ChatroomModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ChatroomModel(
      chatroomId: data?['ChatroomId'],
      lastMessage: data?['LastMessage'], 
      lastMessageTs: DateTime.fromMillisecondsSinceEpoch(
        (data?['LastMessageTs'] as int),
      ),
      members: List<String>.from(data?["Members"]), 
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (data?['CreatedAt'] as int)
      ),
    );
  } 
}