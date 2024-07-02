// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:digiken/first_page.dart';
import 'package:digiken/last_people.dart';
import 'package:digiken/lastpage.dart';
import 'package:digiken/peoplelogin.dart';
import 'package:digiken/quicklogin.dart';
import 'package:digiken/adminlogin.dart';
import 'package:digiken/table_page.dart';
import 'package:flutter/material.dart';
import 'disp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        MyWidget.routeName: (context) => MyWidget(),
        FirstPage.routeName: (context) => FirstPage(),
        QuickLogIn.routeName: (context) => QuickLogIn(),
        Peoplelogin.routeName: (context) => Peoplelogin(),
        AdminLogin.routeName: (context) => AdminLogin(),
        Peopleloginlast.routeName: (context) => Peopleloginlast(),
        TabularScreen.routeName: (context) => TabularScreen(),
        // Lastpage.routeName: (context) => Lastpage(),
      },
    );
  }
}
