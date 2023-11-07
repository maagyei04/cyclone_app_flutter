import 'package:cyclone/src/constants/colors.dart';
import 'package:cyclone/src/features/core/screens/analytics/analytics.dart';
import 'package:cyclone/src/features/core/screens/home/home.dart';
import 'package:cyclone/src/features/core/screens/post/post.dart';
import 'package:cyclone/src/features/core/screens/profile/profile.dart';
import 'package:cyclone/src/features/core/screens/request/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final tBackgroundColor = isDarkMode ? tSecondaryColor : tWhiteColor;
    final tIconColor = isDarkMode ? tWhiteColor : Colors.black54;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: tBackgroundColor,
          indicatorColor: tPrimaryColor.withOpacity(0.1),
          height: 72.0,
          elevation: 8,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: 
          [        
            NavigationDestination(icon: Icon(Icons.home_filled, color:tIconColor, size: 30.0,), label: 'Home',),
            NavigationDestination(icon: Icon(Icons.request_page_rounded, color: tIconColor, size: 30.0), label: 'Request'),
            NavigationDestination(icon: Icon(Icons.add_box_rounded, color: tIconColor, size: 30.0), label: 'Post'),
            NavigationDestination(icon: Icon(Icons.energy_savings_leaf_rounded, color: tIconColor, size: 30.0), label: 'Analytics'),
            NavigationDestination(icon: Icon(Icons.person_2_rounded, color: tIconColor, size: 30.0), label: 'Profile',)
          ]
      
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    ); 
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomeScreen(),
    RequestScreen(),
    PostScreen(),
    AnalyticsScreen(),
    ProfileScreen(),
  ];
}