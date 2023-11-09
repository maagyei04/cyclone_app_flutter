import 'package:cyclone/src/commom_widgets/appbar/appbar.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      image: tProfile,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tWelcome, style: TextStyle(fontSize: 15),),
          Text(tHomeScreenName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.energy_savings_leaf), ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.email_rounded)),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_rounded)),
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
  }
}