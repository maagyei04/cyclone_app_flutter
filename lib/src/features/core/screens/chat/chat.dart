import 'package:cyclone/src/commom_widgets/searchbar/search_bar.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/features/core/controllers/chat_controller.dart';
import 'package:cyclone/src/features/core/screens/chat/providers/get_all_messages_provider.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.userId});

  final String? userId;

  @override
  Widget build(BuildContext context) {
    final ChatController2 chatController = Get.put(ChatController2());
    Get.put(MessageController());
    return GetBuilder<ChatController2>(
      init: chatController,
      builder: (_) {
        return FutureBuilder<void>(
          future: chatController.createChatroom(userId: userId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final chatroomId = chatController.chatroomId.value;

            // Use chatroomId in your UI or return the Scaffold with the chatroomId
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Messages', style: Theme.of(context).textTheme.displayLarge,),
              ),
              body: const SingleChildScrollView(
                child: Column(
                  children: [
                    TSearchContainer(
                      width: double.infinity,
                      text: 'Search...',
                      showbackground: false,
                    ),             

                    SizedBox(height: 20.0,),
                    
                    SizedBox(
                      height: 600,
                      child: ChatList(),
                    ),
                  ],
                ),
              )
            );
          },
        );
      },
    );
  }
}
