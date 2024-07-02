// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Lastpage extends StatefulWidget {
  static const routeName = "/jb";
  final String wname;
  final String tokenNo;
  final String time;
  const Lastpage(
      {required this.time,
      required this.tokenNo,
      required this.wname,
      super.key});

  @override
  State<Lastpage> createState() => _LastpageState();
}

// String wname = "";
// String phoneNo = "";
// String tokenNo = "";

// Future getData() async {
//   const url =
//       "https://nvp2-firebase-default-rtdb.firebaseio.com/bookedtokens.json";
//   final response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     final Map<String, dynamic>? data = json.decode(response.body);
//     print(response.body.toString());
//     if (data != null) {
//       final tokenDetails = data.values.last;
//       final name = tokenDetails['name'];
//       tokenNo = tokenDetails['token_no'];
//       final time = tokenDetails['time'];
//       phoneNo = tokenDetails['phone_no'];
//       wname = tokenDetails['name'];
//     }
//   } else {
//     // Handle error...
//   }
// }

class _LastpageState extends State<Lastpage> {
  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final name = routeArgs['name'];
    // // final phoneNo = routeArgs['phone_no'];
    // final tokenNo = routeArgs['token_no'];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Digiken',
            style: GoogleFonts.anekTamil(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 113, 19, 128),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 17, 135, 195),
          Color.fromARGB(255, 126, 23, 144),
          Color.fromARGB(255, 126, 6, 112)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.wname,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text('TOKEN BOOKED'),
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Token Number',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.tokenNo,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateFormat.jm().format(DateTime.now()).toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                // Row(
                //   children: [
                //     Text(
                //       'Remaining Time',
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     ),
                //     Text(
                //       ':',
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     ),
                //     Text(
                //       '12:12',
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
