import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/core/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tAppName, style: Theme.of(context).textTheme.bodyLarge,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(tImageUploadTitle, style: Theme.of(context).textTheme.displayLarge,),
                const SizedBox(height: tFormHeight - 20,),
                Text(tImageUploadSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium,),
                const SizedBox(height: tFormHeight - 10,),
              ],
            ),

            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side:  const BorderSide(color: Color(0xFF398d1c)),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20.0),
                foregroundColor: Colors.white, 
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.grey, shape: BoxShape.circle
                ),
                child: const Icon(Icons.camera_alt_rounded),
              ),
            ),

            const SizedBox(height: tFormHeight - 10,),

            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded), 
                    label: Text(tImageUploadCameraText, style: Theme.of(context).textTheme.displayMedium,),
                  ),
                ),

                const SizedBox(height: tFormHeight - 10,),


                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.image_rounded), 
                    label: Text(tImageUploadGalleryText, style: Theme.of(context).textTheme.displayMedium,),
                  ),
                ),
              ],
            ),

            const SizedBox(height: tFormHeight - 10,),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.offAll(() => const ProfileScreen());
                    }, 
                    child: const Text(tSkip,),
                  ),
                ),
                const SizedBox(width: tFormHeight -20,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}, 
                    child: const Text(tContinue),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}