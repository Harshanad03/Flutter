// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pn/admin/activation.dart';
import 'package:pn/admin/admindash.dart';

import 'package:flutter/services.dart';
import 'package:pn/chatting_page.dart';
import 'package:pn/get_workers_det.dart';
import 'package:pn/member/worker_profile.dart';
import 'package:pn/member_dashboard.dart';
import 'package:pn/member/member_details.dart';
import 'package:pn/member/get_member_details.dart';
import 'package:pn/member/member.dart';

import 'package:pn/login.dart';

import 'package:pn/home.dart';
import 'package:pn/member_details.dart';
import 'package:pn/workers_details.dart';

import 'member/workersdetails.dart';
import 'member/worker_directory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        WelcomePage.routeName: (context) => WelcomePage(),
        GetMemberDetails.routeName: (context) => GetMemberDetails(),
        DashBoard.routeName: (context) => DashBoard(),
        Members.routeName: (context) => Members(),
        Member.routeName: (context) => Member(),
        Workers.routeName: (context) => Workers(),
        Activation.routName: (context) => Activation(),
        Admindash.routeName: (context) => Admindash(),
        WorkerDetails.routeName: (context) => WorkerDetails(),
        Wrkdirect.routeName: (context) => Wrkdirect(),
        Details.routeName: (context) => Details(),
        ChattingPage.routeName: (context) => ChattingPage(
              myName: 'User',
            ),
        WorkerProfile.routeName: (context) => WorkerProfile(),
        GetWorkerDetails.routeName: (context) => GetWorkerDetails(),
      },
    );
  }
}
