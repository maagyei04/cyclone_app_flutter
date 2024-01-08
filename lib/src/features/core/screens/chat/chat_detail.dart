import 'dart:io';

import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/app_bar_widget.dart';
import 'package:cyclone/src/features/core/screens/chat/widgets/message_list.dart';
import 'package:cyclone/src/repository/chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({super.key, required this.userId});

  final String userId;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
    late XFile? image;
    late XFile? video;

    late File imageFile;
    late File videoFile;

    final data = Get.arguments;
    late final ChatRepository chatController;

    late final TextEditingController messageController;
    late final String chatroomId;
    bool isChatroomIdInit = false;

    @override
    void initState() {
      super.initState();
      chatController = Get.find();
      messageController = TextEditingController();
      fetchChatroomId();
    }

    void fetchChatroomId() async {
      final snapshot = await chatController.createChatroom(userId: widget.userId);
      setState(() {
        chatroomId = snapshot;
        isChatroomIdInit = true;
      });
    }    

    @override
    void dispose() {
      messageController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: chatController.createChatroom(userId: widget.userId), 
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(onPressed: () {
                    Get.back();
                  }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: AppBarWidget(data: data),
          elevation: 5.0,
        ),
        body: Column(
          children: [
            Expanded(child: MessagesList(chatroomId: chatroomId),),
            const Divider(),
            _buildMessageInput(),
          ],
        )
    );
      }

    );
    
  }

  Widget _buildMessageInput() {
        final controller =  Get.put(ChatRepository());

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image, color: Colors.grey,),
            onPressed: () async {
                                  showModalBottomSheet(
                                    context: context, 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                                    ),
                                    builder: (context) => Container(
                                      padding: const EdgeInsets.all(tDefaultSize),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Image Source', style: Theme.of(context).textTheme.displayLarge,),
                                            Text('Select one of the options below, to add image', style: Theme.of(context).textTheme.displayMedium,),
                                            const SizedBox(height: tFormHeight,),
                                            ForgotPasswordBtnWidget(
                                              btnIcon: Icons.camera_enhance_rounded,
                                              title: 'Camera',
                                              subTitle: 'Take live image',
                                              onTap: () async {
                                                Navigator.pop(context);
                                                  image = await ImagePicker().pickImage(source: ImageSource.camera);
                                                    if (image != null) {
                                                      imageFile = File(image!.path);
                                                      // Now 'image' is a File object that can be used where a File is expected
                                                    }
                                              },
                                            ),
                                            const SizedBox(height: tFormHeight - 10,),
                                            ForgotPasswordBtnWidget(
                                              btnIcon: Icons.photo_album_rounded,
                                              title: 'Gallery',
                                              subTitle: 'Select from Gallery',
                                              onTap: () async {
                                                Navigator.pop(context);
                                                  image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                    if (image != null) {
                                                      imageFile = File(image!.path);
                                                      // Now 'image' is a File object that can be used where a File is expected
                                                    }
                                              }
                                            ),
                                          ]
                                        ),
                                      )
                                    ),
                                  );
              if (imageFile == null) return;
              await controller.sendFileMessage(
                file: imageFile,
                chatroomId: chatroomId, 
                recieverId: widget.userId, 
                messageType: 'image'
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.video_camera_front_rounded,
              color: Colors.grey,
              size: 20,
            ),
            onPressed: () async {
                                  showModalBottomSheet(
                                    context: context, 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(tFormHeight - 10),
                                    ),
                                    builder: (context) => Container(
                                      padding: const EdgeInsets.all(tDefaultSize),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Video Source', style: Theme.of(context).textTheme.displayLarge,),
                                            Text('Select one of the options below, to add video', style: Theme.of(context).textTheme.displayMedium,),
                                            const SizedBox(height: tFormHeight,),
                                            ForgotPasswordBtnWidget(
                                              btnIcon: Icons.camera_enhance_rounded,
                                              title: 'Video',
                                              subTitle: 'Take live video',
                                              onTap: () async {
                                                Navigator.pop(context);
                                                  video = await ImagePicker().pickVideo(source: ImageSource.camera);
                                                    if (video != null) {
                                                      videoFile = File(video!.path);
                                                      // Now 'image' is a File object that can be used where a File is expected
                                                    }
                                              },
                                            ),
                                            const SizedBox(height: tFormHeight - 10,),
                                            ForgotPasswordBtnWidget(
                                              btnIcon: Icons.photo_album_rounded,
                                              title: 'Gallery',
                                              subTitle: 'Select from Gallery',
                                              onTap: () async {
                                                Navigator.pop(context);
                                                  video = await ImagePicker().pickVideo(source: ImageSource.gallery);
                                                    if (video != null) {
                                                      videoFile = File(video!.path);
                                                      // Now 'image' is a File object that can be used where a File is expected
                                                    }                                              }
                                            ),
                                          ]
                                        ),
                                      )
                                    ),
                                  );              
              if (videoFile == null) return;
              await controller.sendFileMessage(
                file: videoFile, 
                chatroomId: chatroomId, 
                recieverId: widget.userId, 
                messageType: 'video'
              );
            }, 
          ),
          Expanded(
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: messageController,
                style: const TextStyle(fontSize: 12.0),
                decoration: const InputDecoration(
                  hintText: 'Aa',
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 20,
                    bottom: 10,
                  )
                ),
                textInputAction: TextInputAction.done,
              ),
            )
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: tPrimaryColor,
            ),
            onPressed: () async {
              // Add functionality to handle send button press
              await controller.sendMessage(
                    message: messageController.text,
                    chatroomId: chatroomId,
                    recieverId: widget.userId,
                  );
              messageController.clear();
            },
          ),
        ],
      ),         
    );
  }
}