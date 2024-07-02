import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/get_data.dart';
import 'package:pn/member/member.dart';
import 'package:pn/member/workersdetails.dart';
import 'package:pn/postData.dart';

import '../workers_details.dart';
import 'worker_directory.dart';

class WorkerProfile extends StatefulWidget {
  WorkerProfile({super.key});
  static const routeName = "/workerprofile";

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  late String phno;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile page"),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  args!["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(args["address"]),
                const SizedBox(
                  height: 10,
                ),
                Text(args["work"]),
                const SizedBox(
                  height: 10,
                ),
                Text(args["ph_no"]),
                const SizedBox(
                  height: 20,
                ),
                args["isBooked"]
                    ? ElevatedButton(
                        onPressed: Member.username == args["booked_by"]
                            ? () {
                                setState(() {
                                  _isLoading = true;
                                });
                                print(args["isBooked"]);
                                final response =
                                    postData("/unbookworker", queryParams: {
                                  "id": args["id"],
                                  "date": DateFormat.yMd()
                                      .format(DateTime.now())
                                      .toString(),
                                  "booked_by": Member.username,
                                }).then((value) {
                                  showUnbookAlertDialog(context);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              }
                            : null,
                        child: SizedBox(
                          child: Member.username == args["booked_by"]
                              ? const Text("Work Done!!")
                              : const Text("booked by someone"),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          print(args["id"]);
                          final response =
                              postData("/bookworker", queryParams: {
                            "id": args["id"],
                            "date": DateFormat.yMd()
                                .format(DateTime.now())
                                .toString(),
                            "booked_by": Member.username,
                          }).then((value) {
                            showAlertDialog(
                              context,
                            );
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        },
                        child: const Text("Book Worker"),
                      ),
              ],
            ),
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

void showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text("success"),
    content: const Text("Worker booked"),
    actions: [
      ElevatedButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).popAndPushNamed(Workers.routeName);
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

void showUnbookAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text("success"),
    content: const Text("Worker Unbooked"),
    actions: [
      ElevatedButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).popAndPushNamed(Workers.routeName);
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
