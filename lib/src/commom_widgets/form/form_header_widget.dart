import 'package:flutter/material.dart';


class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageColor,
    this.heightBetween,
    this.textAlign,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double? heightBetween;
  final double imageHeight;
  final Color? imageColor;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image),
         height: size.height * imageHeight,
         color: imageColor,
        ),
        SizedBox(height: heightBetween,),
        Text(title, style: Theme.of(context).textTheme.bodyLarge,),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}