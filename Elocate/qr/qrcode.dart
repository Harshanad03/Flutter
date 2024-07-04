// ignore_for_file: prefer_const_constructors

import 'package:chan_s_application4/presentation/track/track.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/success/sucess.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Myqr(),
));

class Myqr extends StatefulWidget {
  const Myqr();

  @override
  State<Myqr> createState() => _MyqrState();
}

class _MyqrState extends State<Myqr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 67, 66, 66),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 200,
                    color: Colors.green,
                  )),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  onTapArrowDow(context);
                  print('Next button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 45, 141, 66),
                ),
                child: Text(
                  'Pay Later',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            ));
    }
  onTapArrowDow(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>Mysucess(),
        isScrollControlled: true);
  }
}