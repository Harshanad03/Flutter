// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:digiken/adminlogin.dart';
import 'package:digiken/first_page.dart';
import 'package:digiken/peoplelogin.dart';
import 'package:digiken/quicklogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  static const routeName = "/first";
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(113, 19, 128, 1),
        title: Text(
          'DIGIKEN',
          style: GoogleFonts.anekTamil(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Help",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 11, 11),
                          ),
                        ),
                        Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 9, 9, 9),
                          ),
                        ),
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(11, 11, 11, 1),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 17, 135, 195),
          Color.fromARGB(255, 126, 23, 144),
          Color.fromARGB(255, 126, 6, 112),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QuickLogIn.routeName);
                    // Navigator.pushNamed(context, MyWidget.routeName);
                    // print("object0;");
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 240, 237, 237),
                    child: SizedBox(
                      height: 65,
                      width: 200,
                      child: Center(
                        child: Text(
                          "Quick Book",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Peoplelogin.routeName);
                    // print("object0;");
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 231, 220, 228),
                    child: SizedBox(
                      height: 65,
                      width: 200,
                      child: Center(
                        child: Text(
                          "People Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 6, 9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AdminLogin.routeName);
                    // print("object0;");
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 231, 220, 228),
                    child: SizedBox(
                      height: 65,
                      width: 200,
                      child: Center(
                        child: Text(
                          " Admin Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
