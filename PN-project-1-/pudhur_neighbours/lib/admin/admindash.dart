// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pn/admin/activation.dart';
import 'package:pn/admin/admin_login.dart';

import 'package:pn/chatting_page.dart';
import 'package:pn/member_details.dart';
import 'package:pn/workers_details.dart';

class Admindash extends StatefulWidget {
  const Admindash({super.key});

  static const routeName = "/adminPage";
  @override
  State<Admindash> createState() => _AdmindashState();
}

class _AdmindashState extends State<Admindash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 173, 255, 157),
      // appBar: AppBar(
      //   title: Text('Admin '),
      //   backgroundColor: Colors.black,
      // ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 30,
      //       ),
      //       Card(
      //         shape: RoundedRectangleBorder(),
      //         child: Container(
      //           child: Image.asset('assets/logo.png'),
      //           decoration: BoxDecoration(
      //             // color: Colors.cyan,
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(4),
      //             ),
      //           ),
      //           height: 100,
      //           width: 100,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 60,
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(
      //             context,
      //           );
      //           Navigator.pushNamed(context, Members.routeName);
      //         },
      //         style: ButtonStyle(
      //           padding: MaterialStatePropertyAll(
      //             EdgeInsets.fromLTRB(60, 30, 60, 30),
      //           ),
      //           backgroundColor: MaterialStatePropertyAll(
      //             Colors.cyan,
      //           ),
      //           shape: MaterialStatePropertyAll(
      //             RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(55),
      //             ),
      //           ),
      //         ),
      //         child: Text(
      //           'Members',
      //         ),
      //       ),
      //       SizedBox(
      //         height: 30,
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(
      //             context,
      //           );
      //           Navigator.pushNamed(context, Workers.routeName);
      //         },
      //         style: ButtonStyle(
      //           padding: MaterialStatePropertyAll(
      //             EdgeInsets.fromLTRB(60, 30, 60, 30),
      //           ),
      //           backgroundColor: MaterialStatePropertyAll(
      //             Colors.cyan,
      //           ),
      //           shape: MaterialStatePropertyAll(
      //             RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(55),
      //             ),
      //           ),
      //         ),
      //         child: Text('Workers'),
      //       ),
      //       SizedBox(
      //         height: 30,
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(
      //             context,
      //           );
      //           Navigator.pushNamed(context, Activation.routName);
      //         },
      //         style: ButtonStyle(
      //           padding: MaterialStatePropertyAll(
      //             EdgeInsets.fromLTRB(60, 30, 60, 30),
      //           ),
      //           backgroundColor: MaterialStatePropertyAll(
      //             Colors.cyan,
      //           ),
      //           shape: MaterialStatePropertyAll(
      //             RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(55),
      //             ),
      //           ),
      //         ),
      //         child: Text('Activation'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 255, 159, 49),
            ),
            child: Center(
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     child: Image.asset(
          //       'assets/logo.png',
          //     ),
          //   ),
          //   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   title: Text('Group'),
          //   onTap: () {
          //     Navigator.pushNamed(context, ChattingPage.routeName);
          //   },
          // ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 20, 255, 200)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ChattingPage.routeName);
                  },
                  child: Text(
                    'Message',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 20, 255, 200)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Members.routeName);
                  },
                  child: Text(
                    'Members',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 20, 255, 200)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Activation.routName);
                  },
                  child: Text(
                    'Activation',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 20, 255, 200)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Workers.routeName);
                  },
                  child: Text(
                    'Workers',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 65,),
          Container(
            child: Image.asset('assets/logo.png'),
            decoration: BoxDecoration(
              // color: Colors.cyan,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
