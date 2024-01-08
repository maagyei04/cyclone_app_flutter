import 'package:cyclone/src/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
          ),
          const SizedBox(width: 5.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data, style: Theme.of(context).textTheme.headlineLarge),
              Text('Cocycle', style: Theme.of(context).textTheme.displayMedium),
            ],
          )
        ],
      ),
    );
  }
}