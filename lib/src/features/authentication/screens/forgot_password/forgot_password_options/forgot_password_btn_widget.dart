import 'package:cyclone/src/constants/sizes.dart';
import 'package:flutter/material.dart';


class ForgotPasswordBtnWidget extends StatelessWidget {
  
  const ForgotPasswordBtnWidget({
    super.key,
    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(tFormHeight - 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(tFormHeight - 20),
          color: Colors.grey.shade400,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(width: tFormHeight - 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineLarge,),
                SizedBox(
                  width: 150.0,
                  child: Text(subTitle, style: Theme.of(context).textTheme.headlineMedium,))
              ],
            )
          ],
        ),
      ),
    );
  }
}