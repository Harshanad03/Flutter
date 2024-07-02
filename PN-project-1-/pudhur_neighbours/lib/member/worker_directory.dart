// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Wrkdirect extends StatefulWidget {
  const Wrkdirect({super.key});
  static const routeName = "/workDirectory";

  @override
  State<Wrkdirect> createState() => _WrkdirectState();
}

class _WrkdirectState extends State<Wrkdirect> {
  bool _isLoading = false;
  List<dynamic> previous = [];
  List<dynamic> upcomming = [];

  void _agetData() async {
    setState(() {
      _isLoading = true;
    });
    const upurl =
        "https://Saranesh.pythonanywhere.com/getworkerdir?id=upcomming";
    final upres = await http.get(Uri.parse(upurl)).then((value) {
      setState(() {
        _isLoading = false;
      });
      //print(json.decode(value.body));
      final upresult = json.decode(value.body);
      upcomming = upresult;
    });
  }

  void setdata() {
    setState(() {
      _getData();
      _agetData();
    });
  }

  void _getData() async {
    setState(() {
      _isLoading = true;
    });
    const preurl =
        "https://Saranesh.pythonanywhere.com/getworkerdir?id=previous";
    final response = await http.get(Uri.parse(preurl));
    print(response.body);
    final result = json.decode(response.body);
    previous = result;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _agetData();
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: 70,
                      child: Center(child: Text('Previuos')),
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                        itemCount: previous.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(previous[index]["1st_name"]),
                              Text(previous[index]["type of work"]),
                              Text(previous[index]["last_work_date"]),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 270,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                        width: 70,
                        child: Center(child: Text('On Going')),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          itemCount: upcomming.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(upcomming[index]["1st_name"]),
                                Text(upcomming[index]["type of work"]),
                                Text(upcomming[index]["date"]),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_isLoading)
            Container(
              child: Center(
                child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: Colors.pink,
                    rightDotColor: Colors.red,
                    size: 50),
              ),
            ),
        ],
      ),
    );
  }
}
