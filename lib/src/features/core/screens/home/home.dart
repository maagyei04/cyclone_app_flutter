import 'package:cyclone/src/commom_widgets/categories/vertical_categories.dart';
import 'package:cyclone/src/commom_widgets/primary_header_container.dart';
import 'package:cyclone/src/commom_widgets/searchbar/search_bar.dart';
import 'package:cyclone/src/commom_widgets/texts/section_heading.dart';
import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/constants/image_strings.dart';
import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/features/core/screens/home/widgets/home_appbar.dart';
import 'package:cyclone/src/features/core/screens/home/widgets/home_categories.dart';
import 'package:cyclone/src/features/core/screens/home/widgets/requests_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    return Scaffold(
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                const THomeAppBar(), 

                TSearchContainer(
                  width: width, 
                  text: 'Search...',
                ),

                const Padding(
                  padding: EdgeInsets.only(left: tDefaultSize - 20),
                  child: Column(
                    children: [
                     SizedBox(height: 10,),
                    
                     THomeCategories(),
                     
                     SizedBox(height: 10,),

                    ],
                  )
                )
              ],
            ),
          ),

          // -- Second
          const Expanded(child: TRequestsPost()),

        ],

      )
    );
  }
}