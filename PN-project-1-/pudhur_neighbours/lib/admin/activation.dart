// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/get_data.dart';
import 'package:pn/postData.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Activation extends StatefulWidget {
  const Activation({Key? key}) : super(key: key);
  static const routName = "/Activation";

  @override
  State<Activation> createState() => _ActivationState();
}

class _ActivationState extends State<Activation> {
  List<dynamic> memberRegisterData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final response = await getData("/getlogindata");
    setState(() {
      memberRegisterData = response;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Activation'),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.settings),
        //   ),
        //   SizedBox(
        //     width: 20,
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.more_vert_sharp),
        //   ),
        // ],
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: memberRegisterData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blueGrey,
                height: 60,
                margin: EdgeInsets.fromLTRB(10, 6, 10, 6),
                child: ListTile(
                  leading: Text(
                    memberRegisterData[index]["1st_name"]
                        .toString()
                        .substring(0, 1)
                        .toUpperCase(),
                  ),
                  title: Text(memberRegisterData[index]["1st_name"]),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            final id = memberRegisterData[index]["db_id"];
                            final url =
                                "https://Saranesh.pythonanywhere.com/remove?id=$id";
                            final response =
                                await http.post(Uri.parse(url)).then((value) {
                              print(value.body.toString());
                              _isLoading = false;
                            });

                            _getData();
                          },
                          icon: Icon(
                            Icons.done,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });

                            final uid = memberRegisterData[index]["db_id"];
                            final url =
                                "https://Saranesh.pythonanywhere.com/delete?id=$uid";
                            final reponse =
                                await http.post(Uri.parse(url)).then((value) {
                              print(value.body.toString());
                              _isLoading = false;
                            });

                            _getData();
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          if (_isLoading)
            Container(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .9,
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
