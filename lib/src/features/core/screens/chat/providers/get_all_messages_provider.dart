import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/models/message_model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final Rx<Iterable<MessageModel>> messages = Rx<Iterable<MessageModel>>([]);

  StreamSubscription<QuerySnapshot>? _subscription;

  void getAllMessages(String chatroomId) {
    _subscription?.cancel(); // Cancel previous subscription if any

    _subscription = FirebaseFirestore.instance
        .collection('Chatrooms')
        .doc(chatroomId)
        .collection('Messages')
        .snapshots()
        .listen((snapshot) {
      final fetchedMessages = snapshot.docs.map(
        (messageData) => MessageModel.fromMap(
          messageData.data(),
        ),
      );
      messages.value = fetchedMessages.toList();
    });
  }

  @override
  void onClose() {
    _subscription?.cancel(); // Cancel subscription when the controller is closed
    super.onClose();
  }
}
