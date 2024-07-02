// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Image(
              image: AssetImage(
                'assets/images/5.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   height: 300,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage(
          //           'assets/images/Log.jpg',
          //         ),
          //         fit: BoxFit.fill),
          //   ),
          //   child: Container(
          //     padding: EdgeInsets.only(top: 70, left: 40, right: 10),
          //     color: Color.fromARGB(255, 212, 192, 202).withOpacity(.4),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         // RichText(
          //         //   text: TextSpan(
          //         //     text: 'Bus Tracking',
          //         //     style: TextStyle(
          //         //       fontSize: 25,
          //         //       color: Colors.black,
          //         //       fontWeight: FontWeight.bold,
          //         //       letterSpacing: -1,
          //         //     ),
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 250 : 230,
            child: GlassmorphicContainer(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: isSignupScreen ? 400 : 300,
              blur: 1,
              border: 10,
              borderGradient: LinearGradient(colors: [
                Color.fromARGB(255, 0, 0, 0),
                const Color.fromARGB(255, 0, 0, 0),
              ]),
              borderRadius: 8,
              linearGradient: LinearGradient(colors: [
                Colors.white.withOpacity(
                    0.2), // change the opacity value to desired value.
                Colors.white.withOpacity(
                    0.2), // change the opacity value to desired value.
              ]),
              width: mediaquery.width - 40,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceInOut,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 2,
                                  width: 60,
                                  color: Color.fromARGB(255, 110, 110, 110),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 2,
                                  width: 60,
                                  color: Color.fromARGB(255, 110, 110, 110),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) Signin(),
                    if (!isSignupScreen) section(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: isSignupScreen ? 700 : 620,
            left: 150,
            right: 150,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
              ),
              onPressed: () {},
              child: Text('Submit'),
            ),
          ),
          Positioned(
            top: isSignupScreen ? 770 : 720,
            left: 50,
            right: 50,
            child: Container(
              height: 2,
              width: 500,
              color: Colors.grey,
            ),
          ),
          Positioned(
            top: isSignupScreen ? 800 : 760,
            left: 150,
            right: 150,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
              ),
              onPressed: () {},
              child: Image.asset('assets/images/7.png'),
            ),
          ),
        ],
      ),
    );
  }

  Container section() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          NewTextfield(
            Icons.email_outlined,
            'Email',
            false,
            true,
          ),
          NewTextfield(
            Icons.lock_outline,
            'Password',
            true,
            false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    color: Color.fromARGB(255, 195, 196, 198),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container Signin() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          NewTextfield(
            Icons.account_box_outlined,
            'Username',
            false,
            false,
          ),
          NewTextfield(
            Icons.email_outlined,
            'Email',
            false,
            true,
          ),
          NewTextfield(
            Icons.lock_outline,
            'Password',
            true,
            false,
          ),
          NewTextfield(
            Icons.male_outlined,
            'Gender',
            false,
            false,
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By pressing ' Submit' you are agree to our ",
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'terms & conditions',
                    style: TextStyle(
                      color: Color.fromARGB(255, 195, 196, 198),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget NewTextfield(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 204, 204, 204),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
