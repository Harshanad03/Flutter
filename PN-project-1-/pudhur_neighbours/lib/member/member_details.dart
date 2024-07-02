import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/get_data.dart';

import 'get_member_details.dart';

class Details extends StatefulWidget {
  static const routeName = "/memberDetails";

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isLoading = true;

  List<dynamic> memberData = [];

  void _getData() async {
    final response = await getData("/getmemberlogindata");
    setState(() {
      memberData = response;
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
        title: const Text('Members Details'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, GetMemberDetails.routeName);
        //     },
        //     icon: const Icon(Icons.add),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.settings),
        //   ),
        //   const SizedBox(
        //     width: 20,
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.more_vert_sharp),
        //   ),
        // ],
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: memberData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 156, 245),
                    ),
                    child: ListTile(
                      leading: Text(
                        memberData[index]["1st_name"]
                            .toString()
                            .substring(0, 1)
                            .toUpperCase(),
                      ),
                      title: Text(memberData[index]["1st_name"]),
                      trailing: Text(memberData[index]["phone_no"]),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
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
      backgroundColor: Colors.cyan,
    );
  }
}

void actionPopUpItemSelected(String value, String name) {
  String message;
  if (value == 'edit') {
    message = 'You selected edit for $name';
    // You can navigate the user to edit page.
  } else if (value == 'delete') {
    message = 'You selected delete for $name';
    // You can delete the item.
  } else {
    message = 'Not implemented';
  }
  print(message);
}
