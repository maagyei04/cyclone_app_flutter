import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:cyclone/src/features/core/screens/post/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Make A Post', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: const Column(
            children: [
              FormWidget(),
            ],
          ),
        ),
      )
    );
  }
}