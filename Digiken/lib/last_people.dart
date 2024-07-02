import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'lastpage.dart';

class Peopleloginlast extends StatefulWidget {
  static const routeName = "/peoplelognlast";
  static const url =
      "https://nvp2-firebase-default-rtdb.firebaseio.com/bookedtokens.json";
  const Peopleloginlast({super.key});

  @override
  State<Peopleloginlast> createState() => _PeopleloginlastState();
}

class _PeopleloginlastState extends State<Peopleloginlast> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phcontroller = TextEditingController();
  var quicktoken = 100000;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'DIGIKEN',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 113, 19, 128),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 17, 135, 195),
              Color.fromARGB(255, 126, 23, 144),
              Color.fromARGB(255, 126, 6, 112)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 34,
                            ),
                            Icon(Icons.person),
                            Text('Name'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 36,
                          ),
                          Container(
                            height: 40,
                            width: 250,
                            color: Color.fromARGB(255, 225, 229, 232),
                            child: TextField(
                              controller: namecontroller,
                              decoration: InputDecoration(
                                hintText: ('Enter your name'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //for testing
                Center(
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 34,
                            ),
                            Icon(Icons.call_end_outlined),
                            Text('Phone Number'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 36,
                          ),
                          Container(
                            height: 40,
                            width: 250,
                            color: Color.fromARGB(255, 225, 229, 232),
                            child: TextField(
                              controller: phcontroller,
                              decoration: InputDecoration(
                                hintText: ('Enter your Phone Number'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = false;
                      });
                      quicktoken++;
                      final object = {
                        "name": namecontroller.text,
                        "phone_no": phcontroller.text,
                        "token_no": quicktoken.toString(),
                        "time":
                            DateFormat.jm().format(DateTime.now()).toString()
                      };
                      final name = namecontroller.text;
                      final response = http
                          .post(Uri.parse(Peopleloginlast.url),
                              body: json.encode(object))
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Lastpage(
                                    time: DateFormat.jm()
                                        .format(DateTime.now())
                                        .toString(),
                                    tokenNo: quicktoken.toString(),
                                    wname: name,
                                  )),
                        );

                        // Navigator.popAndPushNamed(context, Lastpage.routeName);
                        setState(() {
                          _isLoading = false;
                          phcontroller.clear();
                          namecontroller.clear();
                        });
                      });
                    },
                    child: Text(
                      'Book Token',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Opacity(
                      opacity: .8,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
