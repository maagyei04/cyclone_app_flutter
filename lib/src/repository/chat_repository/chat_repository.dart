import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/models/chatroom_model.dart';
import 'package:cyclone/src/features/core/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class ChatRepository {
  final _myUid = FirebaseAuth.instance.currentUser!.uid;
  final _storage = FirebaseStorage.instance;

  Future<String> createChatroom({
    required String userId,
  }) async {
    try {
      CollectionReference chatrooms = FirebaseFirestore.instance.collection(
        'Chatrooms',
      );

      // sorted users
      final sortedMembers = [_myUid, userId]..sort((a, b) => a.compareTo(b));

      //existing chatrooms
      QuerySnapshot existingChatrooms = await chatrooms
      .where(
        'Members',
        isEqualTo: sortedMembers,
      )
      .get();

      if (existingChatrooms.docs.isNotEmpty) {
        return existingChatrooms.docs.first.id;
      } else {
        final chatroomId = const Uuid().v1();
        final now = DateTime.now();

        ChatroomModel chatroom = ChatroomModel(
          chatroomId: chatroomId, 
          lastMessage: '...', 
          lastMessageTs: now, 
          members: sortedMembers, 
          createdAt: now,
        );

        await FirebaseFirestore.instance
        .collection('Chatrooms')
        .doc(chatroomId)
        .set(chatroom.toJson());

        return chatroomId;
      }
    } catch (e) {
      return e.toString();
    }
  }

  // Send Message
  Future<String?> sendMessage({
    required String message,
    required String chatroomId,
    required String recieverId,
  }) async {
    try {
      final messageId = const Uuid().v1();
      final now = DateTime.now();

      MessageModel newMessage = MessageModel(
        message: message, 
        messageId: messageId, 
        senderId: _myUid, 
        recieverId: recieverId, 
        timestamp: now, 
        seen: false, 
        messageType: 'text',
      );

      DocumentReference myChatroomRef = FirebaseFirestore.instance
      .collection('Chatrooms')
      .doc(chatroomId);

      await myChatroomRef
      .collection('Messages')
      .doc(messageId)
      .set(newMessage.toJson());

      await myChatroomRef 
      .update({
        'LastMessage': message,
        'LastMessageTs': now.millisecondsSinceEpoch,
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }

    // Send File Message
  Future<String?> sendFileMessage({
    required File file,
    required String chatroomId,
    required String recieverId,
    required String messageType,
  }) async {
    try {
      final messageId = const Uuid().v1();
      final now = DateTime.now();

      // Save Message To Storage
      Reference ref = _storage.ref(messageType).child(messageId);
      TaskSnapshot snapshot = await ref.putFile(file);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      MessageModel newMessage = MessageModel(
        message: downloadUrl, 
        messageId: messageId, 
        senderId: _myUid, 
        recieverId: recieverId, 
        timestamp: now, 
        seen: false, 
        messageType: messageType,
      );

      DocumentReference myChatroomRef = FirebaseFirestore.instance
      .collection('Chatrooms')
      .doc(chatroomId);

      await myChatroomRef
      .collection('Messages')
      .doc(messageId)
      .set(newMessage.toJson());

      await myChatroomRef 
      .update({
        'LastMessage': 'sent a $messageType',
        'LastMessageTs': now.millisecondsSinceEpoch,
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Seen Message
  Future<String?> seenMessage({
    required String chatroomId,
    required String messageId,
  }) async {
    try {
      await FirebaseFirestore.instance
      .collection('Chatrooms')
      .doc(chatroomId)
      .collection('Messages')
      .doc(messageId)
      .update({
        'Seen': true,
      });

      return null;      
    } catch (e) {
      return e.toString();
    }

  }
}