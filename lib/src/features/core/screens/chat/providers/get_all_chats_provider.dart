// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/models/chatroom_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatroomController extends GetxController {
  final Rx<List<ChatroomModel>> chatrooms = Rx<List<ChatroomModel>>([]);

  StreamSubscription<QuerySnapshot>? _subscription;

  @override
  void onInit() {
    getAllChats();
    super.onInit();
  }

  void getAllChats() {
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    _subscription?.cancel(); // Cancel previous subscription if any

    _subscription = FirebaseFirestore.instance
        .collection('Chatrooms')
        .where('Members', arrayContains: myUid)
        .orderBy('LastMessageTs')
        .snapshots()
        .listen((snapshot) {
      try {
        final fetchedChats = snapshot.docs.map(
          (chatData) => ChatroomModel.fromMap(
            chatData.data(),
          ),
        );
        chatrooms.value = fetchedChats.toList();
      } catch (e) {
        print('Error fetching chatrooms: $e');
      }
    });
  }

  @override
  void onClose() {
    _subscription?.cancel(); // Cancel subscription when the controller is closed
    super.onClose();
  }
}
