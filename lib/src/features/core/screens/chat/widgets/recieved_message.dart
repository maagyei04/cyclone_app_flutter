import 'package:cyclone/src/features/core/models/message_model.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/message_content.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/round_profile_pic.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final MessageModel message;

  const ReceivedMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          MyProfilePic(userId: message.senderId),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: MessageContents(message: message),
            ),
          ),
        ],
      ),
    );
  }
}
