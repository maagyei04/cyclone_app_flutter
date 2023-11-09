import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, 
    this.textColor, 
    this.showActionbutton = true, 
    required this.title, 
    this.buttonTitle = 'View all', 
    this.onpressed,
  });

  final Color? textColor;
  final bool showActionbutton;
  final String title, buttonTitle;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: TextStyle(color: textColor, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if (showActionbutton) TextButton(onPressed: (){}, child: Text(buttonTitle))
      ],
    );
  }
}

