import 'package:cyclone/src/commom_widgets/categories/vertical_categories.dart';
import 'package:cyclone/src/features/core/controllers/profile_controller.dart';
import 'package:cyclone/src/features/core/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    
    return FutureBuilder<List<dynamic>>(
      future: controller.getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print(snapshot.data);
             return
                SizedBox(
                  height: 50,
                    child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length, 
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return TVerticalCategories(
                        title: snapshot.data![index]  ?? 'Electronics',
                        onTap: (){},
                      );
                      
                    }),
                  );

          } else if (snapshot.hasError) {
                                  // ignore: avoid_print
                                  print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
        } else {
              return const Center(
                child: Text('Please wait...', style: TextStyle(color: Colors.white),)
              );
          }
      },
    
    );
  }
}