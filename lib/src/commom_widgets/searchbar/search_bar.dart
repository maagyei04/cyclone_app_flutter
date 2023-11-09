import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.width,
    required this.text,
    this.icon = Icons.search_rounded,
    this.showBorder,
    this.showbackground,
    this.onTap,
  });

  final double width;
  final String text;
  final IconData? icon;
  final bool? showbackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize - 20),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: tWhiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 100, 100, 100)),
              const SizedBox(width: 16.0,),
              Text(text, style: const TextStyle(color: Color.fromARGB(255, 100, 100, 100)),)
            ],
          ),
        ),
      ),
    );
  }
}

