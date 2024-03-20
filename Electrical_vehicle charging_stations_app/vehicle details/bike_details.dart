// ignore_for_file: prefer_const_constructors

import 'package:chan_s_application4/presentation/qr/qrcode.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: bikedetails(),
));

class bikedetails extends StatefulWidget {
  const bikedetails();

  @override
  State<bikedetails> createState() => _bikedetailsState();
}

class _bikedetailsState extends State<bikedetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      color: Colors.black,
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
                            'Name',
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
                                  labelText: "Enter your name",
                                  labelStyle: TextStyle(
                                    color: const Color.fromARGB(255, 101, 99, 99),
                                  ),
                                  hintText: "Rani"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 10),
                          child: Text(
                            'Phone Number',
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
                                      color: Colors.green,
                                    ),
                                  ),
                                  labelText: "Enter your phone number",
                                  labelStyle: TextStyle(
                                    color: const Color.fromARGB(255, 101, 99, 99),
                                  ),
                                  hintText: "Enter your phone number"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 10),
                          child: Text(
                            'Car Number',
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
                                      color: Colors.green,
                                    ),
                                  ),
                                  labelText: "Enter your car number",
                                  labelStyle: TextStyle(
                                    color: const Color.fromARGB(255, 101, 99, 99),
                                  ),
                                  hintText: "Enter your car number"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 10),
                          child: Text(
                            'Charger Port Type',
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
                                      color: Colors.green,
                                    ),
                                  ),
                                  labelText: "Enter your port type",
                                  labelStyle: TextStyle(
                                    color: const Color.fromARGB(255, 101, 99, 99),
                                  ),
                                  hintText: "Enter your port type"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                'Cash',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {

                                print('Next button pressed!');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 45, 141, 66),
                              ),
                              child: Text(
                                'Transfer',
                                style: TextStyle(color: Colors.black),
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
          ),
    );
    }
  onTapArrowDownon(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Myqr(),
        isScrollControlled:true);
    }
}