import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/screens/chat/chat.dart';
import 'package:cyclone/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.userId,
    required this.lastMessage,
    required this.lastMessageTs,
    required this.chatroomId,
  });

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context) {
    final userInfoController = Get.put(UserRepository());

    return FutureBuilder<UserModel?>(
      future: userInfoController.getUserInfoById(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Replace with a suitable widget for the loading state
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const CircularProgressIndicator(
            color: Colors.red,
          ); // Replace with a suitable error widget
        }

        final user = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: InkWell(
            onTap: () {
              Get.to(() => ChatScreen(userId: userId));
            },
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: tSecondaryColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         user.firstName ?? 'default...', 
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              lastMessage ?? 'default...',
                              style: const TextStyle(color: tSecondaryColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text('--'),
                          const Text(
                            'default...',
                            style: TextStyle(color: tSecondaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
