// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pn/get_workers_det.dart';
import 'package:pn/member/worker_profile.dart';

import '../get_data.dart';

class WorkerDetails extends StatefulWidget {
  static const routeName = "/workerDetail";

  const WorkerDetails({super.key});

  @override
  State<WorkerDetails> createState() => _WorkerDetailsState();
}

class _WorkerDetailsState extends State<WorkerDetails> {
  bool _isLoading = true;

  List workerData = [];

  void _getData() async {
    final response = await getData("/getworkerdata");
    setState(() {
      workerData = response;
      _isLoading = false;
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
      appBar: AppBar(
        title: Text('Workers Details'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, GetMemberDetails.routeName);
        //     },
        //     icon: Icon(Icons.add),
        //   ),
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
            itemBuilder: (_, i) {
              return ListTile(
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    WorkerProfile.routeName,
                    arguments: {
                      "id": workerData[i]["db_id"],
                      "name": workerData[i]["1st_name"],
                      "address": workerData[i]["address"],
                      "work": workerData[i]["type of work"],
                      "ph_no": workerData[i]["phone_no"],
                      "isBooked": workerData[i]["isBooked"],
                      "booked_by": workerData[i]["booked_by"],
                    },
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(workerData[i]["1st_name"]
                      .toString()
                      .substring(0, 1)
                      .toUpperCase()),
                ),
                title: Text(workerData[i]["1st_name"].toString()),
                subtitle: Text(workerData[i]["2nd_name"].toString()),
                // trailing: PopupMenuButton(
                //   itemBuilder: (context) {
                //     return [
                //       PopupMenuItem(
                //         value: 'edit',
                //         child: Text('Edit'),
                //       ),
                //       PopupMenuItem(
                //         value: 'delete',
                //         child: Text('Delete'),
                //       )
                //     ];
                //   },
                //   onSelected: (String value) {
                //     print('You Click on po up menu item');
                //   },
                // ),
              );
            },
            itemCount: workerData.length,
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
      backgroundColor: Colors.cyan,
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




// void actionPopUpItemSelected(String value, String name) {
//   String message;
//   if (value == 'edit') {
//     message = 'You selected edit for $name';
//     // You can navigate the user to edit page.
//   } else if (value == 'delete') {
//     message = 'You selected delete for $name';
//     // You can delete the item.
//   } else {
//     message = 'Not implemented';
//   }
//   print(message);
// }



