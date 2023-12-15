import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: Text('Submit Feedback', style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tFeedbackTitle, style: Theme.of(context).textTheme.displayLarge,),
              const SizedBox(height: 10.0,),
              Text(tFeedbackSubTitle, style: Theme.of(context).textTheme.displayMedium,),
              const SizedBox(height: 10.0,),
              TextFormField(
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: tSendMessage,
                  labelText: tSendMessage,
                ),
              ),
              const SizedBox(height: 40.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text('Submit')))            
            ],
          ),
        ),
      ),
    );
  }
}