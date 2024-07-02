// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Bus Tracking")),
        leading: Icon(
          Icons.person,
          color: Colors.white,
          size: 40,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 6, 47, 82),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 350,
                  width: 350,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 7),
                      TextFormField(
                        decoration: InputDecoration(labelText: " BUS NO -"),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        decoration: InputDecoration(labelText: " NAME -"),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        decoration: InputDecoration(labelText: " FROM -"),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        decoration: InputDecoration(labelText: " TO -"),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text("LIVE LOCATION")],
          )
        ],
      ),
      floatingActionButton: Icon(
        Icons.arrow_circle_right,
        size: 60,
      ),
    );
  }
}
