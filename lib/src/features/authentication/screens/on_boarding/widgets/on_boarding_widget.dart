import 'package:cyclone/src/features/authentication/models/model_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key, // Fix the typo here (super.key should be Key key)
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          model.image,
          height: size.height,
          width: size.width,
          fit: BoxFit.cover, // This ensures the image covers the entire screen
        ),
        Container(
          color:const Color.fromARGB(78, 54, 54, 54), // Add a semi-transparent overlay
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  Column(
                    children: [
                      Text(model.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
                      Text(model.subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  Text(model.counterText, style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 80.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
