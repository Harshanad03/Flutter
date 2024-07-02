import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/get_data.dart';
import 'package:pn/get_workers_det.dart';

import 'member/worker_profile.dart';

class Workers extends StatefulWidget {
  const Workers({super.key});
  static const routeName = "/Workers";
  @override
  State<Workers> createState() => _WorkersState();
}

class _WorkersState extends State<Workers> {
  bool _isLoading = true;
  List<dynamic> workerData = [];

  void _getData() async {
    final response = await getData("/getworkerdata");
    setState(() {
      _isLoading = false;
      workerData = response;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Worker page'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: workerData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blueGrey,
                height: 60,
                margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                child: ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, WorkerProfile.routeName,
                        arguments: {
                          "name": workerData[index]["1st_name"],
                          "address": workerData[index]["address"],
                          "work": workerData[index]["type of work"],
                          "ph_no": workerData[index]["phone_no"],
                          "booked_by": workerData[index]["booked_by"],
                          "isBooked": workerData[index]["isBooked"],
                          "id": workerData[index]["db_id"],
                        });
                  },
                  leading: Text(
                    workerData[index]["1st_name"]
                        .toString()
                        .substring(0, 1)
                        .toUpperCase(),
                  ),
                  title: Text(workerData[index]["1st_name"]),
                  trailing: Text(workerData[index]["phone_no"]),
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
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, GetWorkerDetails.routeName);
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
