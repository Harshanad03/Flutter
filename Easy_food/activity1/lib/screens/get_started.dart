import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade800,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(140),
          child: Image(
            fit: BoxFit.fill,
            height: 250,
            width: 250,
            image: AssetImage("assets/cook.jpg"),
          ),
        ),
      ),
    );
  }
}
