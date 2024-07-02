// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/member_dashboard.dart';

import 'get_member_details.dart';

class Member extends StatefulWidget {
  const Member({super.key});
  // ignore: prefer_typing_uninitialized_variables
  static var username;
  static const routeName = "/member";
  @override
  State<Member> createState() => _MemberState();
}

TextEditingController uid = TextEditingController();
TextEditingController pwd = TextEditingController();
TextEditingController reguid = TextEditingController();
TextEditingController regpwd = TextEditingController();
bool _isLoading = false;
bool _acceptTerms = false;
void showAlertDialog(BuildContext context, content) {
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(content),
    actions: [
      ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _MemberState extends State<Member> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Pudur\nNeighbours',
                    style: TextStyle(
                        color: Color.fromARGB(255, 93, 6, 6), fontSize: 33),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                uidWid(uid),
                SizedBox(
                  height: 10,
                ),
                pwdWid(pwd),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Please accept the terms and conditions to continue:'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            value: _acceptTerms,
                            onChanged: (bool value) {
                              setState(() {
                                _acceptTerms = value;
                              });
                            },
                          ),
                          Text('I accept the terms and conditions'),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                _acceptTerms ? Colors.blue : Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: _acceptTerms
                                  ? () async {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      String val;
                                      final response = await http
                                          .get(Uri.parse(
                                              "https://Saranesh.pythonanywhere.com/login?id=${uid.text}&password=${pwd.text}"))
                                          .then((value) {
                                        Member.username = uid.text;
                                        val = value.body;
                                        setState(() {
                                          uid.clear();
                                          pwd.clear();
                                          _isLoading = false;
                                          //print(value.statusCode);
                                        });
                                        if (val == "Login Successful") {
                                          Navigator.popAndPushNamed(
                                              context, DashBoard.routeName);
                                        } else {
                                          showAlertDialog(context,
                                              "Wrong ID or password. Please retry.");
                                        }
                                      });
                                    }
                                  : () {
                                      showAlertDialog(context,
                                          "Please accept the terms and conditions.");
                                    },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Not a member ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, GetMemberDetails.routeName);
                            },
                            child: Text(
                              'New Register',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            _isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Opacity(
                        opacity: .8,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: LoadingAnimationWidget.twistingDots(
                              leftDotColor: Colors.pink,
                              rightDotColor: Colors.red,
                              size: 50),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

Widget pwdWid(txtcontroller) {
  return Container(
    margin: EdgeInsets.only(left: 70, right: 70),
    child: TextField(
      controller: txtcontroller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}

Widget uidWid(txtcontroller) {
  return Container(
    margin: EdgeInsets.only(left: 70, right: 70),
    child: TextField(
      controller: txtcontroller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: "User Id",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}
