// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pn/admin/admin_login.dart';
import 'package:pn/member/member.dart';

import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const routeName = "/loginPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "PUDUR NEIGHBOURS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(40, 30, 40, 30),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.cyan,
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ),
              child: Text(
                "Admin Log In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Member.routeName,
                );
              },
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(30, 30, 30, 30),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.cyan,
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ),
              child: Text(
                "Member Log In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            // SizedBox(height: 175,),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Copyright ©\t",
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: _launchUrl,
            child: Text(
              "Nediveil Technologies",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

final _url = Uri.parse('https://www.nediveil.in');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}
