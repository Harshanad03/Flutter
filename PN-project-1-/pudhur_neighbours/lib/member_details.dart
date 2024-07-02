import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/get_data.dart';
import 'package:pn/member/get_member_details.dart';

class Members extends StatefulWidget {
  const Members({Key? key}) : super(key: key);
  static const routeName = "/Members";
  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Members'),
        //  actions: [
        //  IconButton(
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
          _isLoading
              ? Container(
                  child: Center(
                    child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: Colors.pink,
                        rightDotColor: Colors.red,
                        size: 50),
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, GetMemberDetails.routeName);
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
