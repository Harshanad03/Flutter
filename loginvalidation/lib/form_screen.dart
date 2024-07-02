// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();
  bool passToggle = true;
  bool passsToggle = true;
  bool emailValid = true;
  bool isLocked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.transparent, // Set scaffold background to transparent
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 40, 39, 40),
                Color.fromARGB(255, 35, 35, 35)
              ],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .8,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                      child: Form(
                        key: _formfield,
                        onChanged: () {
                          if (emailValid &&
                              passController.text.length >= 8 &&
                              confirmpassController.text ==
                                  passController.text) {
                            setState(() {
                              isLocked = false;
                            });
                          } else {
                            setState(() {
                              isLocked = true;
                            });
                          }
                        },
                        child: Column(
                          children: [
                            if (isLocked)
                              Icon(Icons.lock, size: 60, color: Colors.white)
                            else
                              Icon(Icons.lock_open_outlined,
                                  size: 60, color: Colors.white),
                            SizedBox(height: 7),
                            TextFormField(
                              validator: (emailcontroller) {
                                if (RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                                    .hasMatch(emailcontroller!)) {
                                  return null;
                                } else {
                                  return 'Enter a valid email';
                                }
                                ;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (pass) {
                                if (pass!.length < 8) {
                                  return 'Enter 8 digit password';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: passController,
                              obscureText: passToggle,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: UnderlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(
                                      passToggle
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            TextFormField(
                              validator: (confirmPass) {
                                if (confirmPass != passController.text) {
                                  return 'Passwords do not match';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              controller: confirmpassController,
                              obscureText: passsToggle,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: UnderlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passsToggle = !passsToggle;
                                    });
                                  },
                                  child: Icon(
                                      passsToggle
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            InkWell(
                              onTap: () {
                                if (_formfield.currentState!.validate()) {
                                  print("Success");
                                  emailController.clear();
                                  passController.clear();
                                  confirmpassController.clear();
                                } else {
                                  print("enter mail and pass");
                                }
                              },
                              child: Center(
                                child: SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: 1), // Add border
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          "Log In",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
