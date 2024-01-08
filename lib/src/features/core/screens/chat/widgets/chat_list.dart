// ignore_for_file: avoid_print

import 'package:cyclone/src/features/core/models/chatroom_model.dart';
import 'package:cyclone/src/features/core/screens/chat/providers/get_all_chats_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/chat_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatroomController chatroomController = Get.put(ChatroomController());

    return Obx(
      () {
        final List<ChatroomModel> chats = chatroomController.chatrooms.value.isNotEmpty
            ? chatroomController.chatrooms.value
            : []; // Or another default value if needed

        if (chats.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        print(chats);
        print(chats.length);

        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];

            // Add null checks or default values to handle potential null values
            final userId = chat.members.isNotEmpty
              ? chat.members.firstWhere(
                  (userId) => userId != FirebaseAuth.instance.currentUser!.uid,
                  orElse: () => 'huPY1eGkCLY1boA19sRenzMjeUl1', // Provide a default user ID or handle the null case
                )
              : 'huPY1eGkCLY1boA19sRenzMjeUl1'; // Provide a default user ID or handle the null case


            // Add conditions to handle null values or provide default values for chat properties
            return ChatTile(
              userId: userId, // Use default value if userId is null
              lastMessage: chat.lastMessage,
              lastMessageTs: chat.lastMessageTs,
              chatroomId: chat.chatroomId,
            );
          },
        );
      },
    );

  }
}
