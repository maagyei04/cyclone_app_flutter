import 'package:cyclone/src/commom_widgets/categories/vertical_categories.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 50,
      child: ListView.builder(
       shrinkWrap: true,
       itemCount: 6, 
       scrollDirection: Axis.horizontal,
       itemBuilder: (_, index) {
         return TVerticalCategories(
           title: 'Electronics',
           onTap: (){},
         );
         
       }),
    );
  }
}