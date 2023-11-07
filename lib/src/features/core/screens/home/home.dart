import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home", style: Theme.of(context).textTheme.bodyMedium,),
          Center(child: Text("Yet To Build The HomeScreen, #Michan", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,), ),
        ],
      ),
    );
  }
}