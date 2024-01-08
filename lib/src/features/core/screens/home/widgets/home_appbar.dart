import 'package:cyclone/src/commom_widgets/appbar/appbar.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/authentication/models/user_model.dart';
import 'package:cyclone/src/features/core/controllers/image_picker_controller.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/screens/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });



  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProfileController());

    return  FutureBuilder(
        future: controller.getUserData(),
         builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel user = snapshot.data as UserModel;
                  return TAppBar(
                  image: user.picture.isNotEmpty 
                          ? NetworkImage(user.picture)
                          : null,
                  title:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(tWelcome, style: TextStyle(fontSize: 15),),
                        Text(user.firstName, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),

           
                  actions: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.energy_savings_leaf), color: tWhiteColor,),
                    IconButton(onPressed: (){
                      Get.to(() => ChatScreen(userId: user.id,));
                    }, icon: const Icon(Icons.email_rounded), color: tWhiteColor,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_rounded), color: tWhiteColor,),
                        Positioned(
                          right: 0,
                          top: 9,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: tDarkColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text("2", style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                  );
     } else if (snapshot.hasError) {
                                  // ignore: avoid_print
                                  print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
          } else {
              return const Center(
                child: Text('Loading...'),
              );
            }
        },
      );
  }
}