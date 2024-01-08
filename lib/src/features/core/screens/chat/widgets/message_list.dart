import 'package:cyclone/src/features/core/screens/chat/providers/get_all_messages_provider.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/recieved_message.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/sent_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    required this.chatroomId,
  });

  final String chatroomId;

  @override
  Widget build(BuildContext context) {
    final MessageController messagesController = Get.find<MessageController>();
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    // Load messages when the widget is first built
    messagesController.getAllMessages(chatroomId);

    return GetX<MessageController>(
      builder: (controller) {
        final messages = controller.messages.value;

        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            final isMyMessage = message.senderId == myUid;

            if (!isMyMessage) {
              controller.markMessageAsSeen(chatroomId, message.messageId);
            }

            return isMyMessage
                ? SentMessage(message: message)
                : ReceivedMessage(message: message);
          },
        );
      },
    );
  }
}

