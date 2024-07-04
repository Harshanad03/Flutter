// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/map/mapmain.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Mybook(),
));

class Mybook extends StatefulWidget {
  const Mybook();

  @override
  State<Mybook> createState() => _MyAppState();
}

class _MyAppState extends State<Mybook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 67, 66, 66),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align children at the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Electro Spartans',
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                  ),
                  Spacer(), // Use Spacer to push the icon to the right
                  Icon(
                    Icons.arrow_forward,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(
                  height: 50), // Adding some spacing between the two Text widgets
              Text(
                'Please Enter Your Details',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 244, 244),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(
                          'Location',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextField(
                            obscureText: false,
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
                                labelText: "Enter your current location",
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 101, 99, 99),
                                ),
                                counterText: "Enter your current location"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(
                          'Charge percentage',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextField(
                            obscureText: false,
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
                                    color: Colors.green,
                                  ),
                                ),
                                labelText: "Enter your charge percentage",
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 101, 99, 99),
                                ),
                                hintText: "Enter your charge percentage"),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              onTapLetsGoButton(context);
                              print('Next button pressed!');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 45, 141, 66),
                            ),
                            child: Text(
                              'Cash',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Add more widgets as needed
            ],
            ),
        );
    }
  onTapLetsGoButton(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SendNot(),
        isScrollControlled: true);
  }
}