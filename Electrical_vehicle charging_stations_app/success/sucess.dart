// ignore_for_file: prefer_const_constructors

import 'package:chan_s_application4/presentation/map/mapteack.dart';
import 'package:chan_s_application4/presentation/track/track.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Mysucess(),
));

class Mysucess extends StatefulWidget {
  const Mysucess();

  @override
  State<Mysucess> createState() => _MysucessState();
}

class _MysucessState extends State<Mysucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 67, 66, 66),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.verified_rounded,
                  size: 200,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Successfully Completed!",
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "Our Emergency Vehicle will",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                "reach you within 10 minutes!",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                "For more information:",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "Driver Name: Raja",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                "Phone Number: 7854328970",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  onTapArrowDownon(context);
                  // Handle the next action here
                  print('Next button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 45, 141, 66),
                ),
                child: Text(
                  'Track Location',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            ),
        );
    }
  void onTapArrowDownon(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Mymaptrack(),
        isScrollControlled:true);

  }
}