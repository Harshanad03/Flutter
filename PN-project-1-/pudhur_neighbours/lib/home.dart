// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:pn/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Connect with skilled workers nearby. \nGet info fast on our app.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              height: 350,
              child: Image.asset('assets/logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, WelcomePage.routeName);
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
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Column(
              children: [
                Text("V-1.7.4", style: TextStyle(color: Colors.black54)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Copyright ©\t"),
                    TextButton(
                      onPressed: _launchUrl,
                      child: Text("Nediveil Technologies"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
