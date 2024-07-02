// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:digiken/table_page.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'lastpage.dart';

class QuickLogIn extends StatefulWidget {
  static const routeName = "/quicklogin";

  static const url =
      "https://nvp2-firebase-default-rtdb.firebaseio.com/bookedtokens.json";
  QuickLogIn({super.key});

  @override
  State<QuickLogIn> createState() => _QuickLogInState();
}

class _QuickLogInState extends State<QuickLogIn> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  var tokenno = 100;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'DIGIKEN',
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
          Color.fromARGB(255, 126, 6, 112),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 9,
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'phone Number',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    )),
                obscureText: _obscureText,
              ),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
              )),
              child: Text(
                'Book Token',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: () {
                print("odclkmbsolute");

                setState(() {
                  _isLoading = true;
                });
                tokenno++;
                final object = {
                  "name": _usernameController.text,
                  "phone_no": _passwordController.text,
                  "token_no": tokenno.toString(),
                  "time": DateFormat.jm().format(DateTime.now()).toString()
                };
                final name = _usernameController.text;

                final response = http
                    .post(Uri.parse(QuickLogIn.url), body: json.encode(object))
                    .then((value) {
                  // Navigate to the new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Lastpage(
                              time: DateFormat.jm()
                                  .format(DateTime.now())
                                  .toString(),
                              tokenNo: tokenno.toString(),
                              wname: name,
                            )),
                  );

                  // Navigator.popAndPushNamed(
                  //   context, Lastpage.routeName,
                  //   // arguments: {
                  //   //   "name": _usernameController,
                  //   //   "token_no": tokenno.toString(),
                  //   //   "time":
                  //   //       DateFormat.jm().format(DateTime.now()).toString()
                  //   // }
                  // );
                  setState(() {
                    _isLoading = false;

                    _passwordController.clear();
                    _usernameController.clear();
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
