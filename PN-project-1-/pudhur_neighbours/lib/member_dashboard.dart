// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pn/chatting_page.dart';
import 'package:pn/member/member_details.dart';

import 'package:pn/member/workersdetails.dart';
import 'package:pn/member/worker_directory.dart';
import 'package:pn/workers_details.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});
  static const routeName = "/dashboardPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
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
                'Members',
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
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
              Container(
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
                    Navigator.pushNamed(context, Details.routeName);
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
              Container(
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
                    'workers',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
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
                    Navigator.pushNamed(context, Wrkdirect.routeName);
                  },
                  child: Text(
                    'History',
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
            height: 65,
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.cyan,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            height: 200,
            width: 200,
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
      //  ),
      // body: ListTile(
      //   leading: CircleAvatar(),
      //   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //   title: Text('Group'),
      //   onTap: () {
      //     Navigator.pushNamed(context, ChattingPage.routeName);
      //   },
      //   // trailing: Text('12:11'),
      // ),
    );
  }
}
