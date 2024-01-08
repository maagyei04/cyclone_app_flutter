import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/src/features/core/models/message_model.dart';
import 'package:cyclone/src/repository/chat_repository/chat_repository.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final Rx<List<MessageModel>> messages = Rx<List<MessageModel>>([]);

  StreamSubscription<QuerySnapshot>? _subscription;

  void getAllMessages(String chatroomId) {
    _subscription?.cancel(); // Cancel previous subscription if any

    _subscription = FirebaseFirestore.instance
        .collection('Chatrooms')
        .doc(chatroomId)
        .collection('Messages')
        .orderBy('TimeStamp', descending: true)
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

  void markMessageAsSeen(String chatroomId, String messageId) {
    var controller = Get.put(ChatRepository());
    controller.seenMessage(chatroomId: chatroomId, messageId: messageId);
  }

  @override
  void onClose() {
    _subscription?.cancel(); // Cancel subscription when the controller is closed
    super.onClose();
  }
}
