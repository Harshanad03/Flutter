// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              height: mediaQuery.height * 0.23,
              width: mediaQuery.width * .6,
              image: AssetImage("assets/cook.jpg"),
            ),
          ),
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sign up or Log In to your Account",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: mediaQuery.height * 0.06,
              width: mediaQuery.width * .85,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      backgroundColor:
                          val ? Colors.orange.shade100 : Colors.orange.shade800,
                    ),
                    onPressed: () {
                      setState(() {
                        val = false;
                      });
                    },
                    child: SizedBox(
                      height: mediaQuery.height * 0.06,
                      width: mediaQuery.width * 0.35,
                      child: Center(
                        child: Text("Log In"),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: val
                            ? Colors.orange.shade800
                            : Colors.orange.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                    onPressed: () {
                      setState(() {
                        val = true;
                      });
                    },
                    child: SizedBox(
                      height: mediaQuery.height * 0.06,
                      width: mediaQuery.width * 0.33,
                      child: Center(
                        child: Text("Sign Up"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          val ? SignUp() : LogIn()
        ],
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange.shade100,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "     Email Address",
                  hintStyle: TextStyle(color: Colors.orange.shade600),
                  suffixIcon: Icon(Icons.mail_outline_rounded,
                      color: Colors.orange.shade600),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Text(
            "Password",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange.shade100,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "     Password",
                  hintStyle: TextStyle(color: Colors.orange.shade600),
                  suffixIcon:
                      Icon(Icons.remove_red_eye, color: Colors.orange.shade600),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("log In"),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
