// ignore_for_file: prefer_const_constructors

import 'package:chan_s_application4/presentation/home_page/home_page.dart';
import 'package:chan_s_application4/presentation/map/map.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/map/mapteack.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Mytrack(),
));

class Mytrack extends StatefulWidget {
  const Mytrack();

  @override
  State<Mytrack> createState() => _MytrackState();
}

class _MytrackState extends State<Mytrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 67, 66, 66),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage("asset/emoji.png"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your Opinion Matters To Us!",
                style: TextStyle(fontSize: 35, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "Rate us!",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 150),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Drop Your Feed Back Here!",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Give your comments",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 101, 99, 99),
                        ),
                        hintText: "Comments"),
                  ),
                ),
              ),
              SizedBox(height: 30),
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
                  'Goback to Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            ),
        );
    }
  onTapArrowDownon(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => HomePage(),
        isScrollControlled:true);
  }
}