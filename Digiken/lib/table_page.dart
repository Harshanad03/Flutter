// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class TabularScreen extends StatefulWidget {
  static const routeName = "/gova";
  static const url =
      "https://nvp2-firebase-default-rtdb.firebaseio.com/bookedtokens.json";

  @override
  State<TabularScreen> createState() => _TabularScreenState();
}

class _TabularScreenState extends State<TabularScreen> {
  List value = [];
  bool _isloading = false;
  Future get() async {
    _isloading = true;
    final response =
        await http.get(Uri.parse(TabularScreen.url)).then((values) {
      print(values.body.toString());
      final Map<dynamic, dynamic> data = json.decode(values.body);

      final List listOfDicts = data.values.toList();
      value += listOfDicts;
      print(listOfDicts);
      setState(() {
        _isloading = false;
      });
    });
    // final res = response;
    // final Map<dynamic, dynamic> data = json.decode(res);

    // final List listOfDicts = data.values.toList();
    // setState(() {
    //   // value += listOfDicts;
    //   _isloading = false;
    // });
  }

  // final List<DataRow> dataRows = [
  //   DataRow(cells: [
  //     DataCell(Text('1')),
  //     DataCell(Text('Jeeva')),
  //     DataCell(Text('9842733026')),
  //     DataCell(Text('Viewed'))
  //   ]),
  //   DataRow(cells: [
  //     DataCell(Text('2')),
  //     DataCell(Text('JB')),
  //     DataCell(Text('9742733026')),
  //     DataCell(Text(''))
  //   ]),
  //   DataRow(cells: [
  //     DataCell(Text('3')),
  //     DataCell(Text('Gova')),
  //     DataCell(Text('9842776760')),
  //     DataCell(Text('Viewed'))
  //   ]),
  // ];
  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 19, 128),
        title: Text('DIGIKEN'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: DataTable(
              //       columns: [
              //         DataColumn(label: Text('Token No.')),
              //         DataColumn(label: Text('Name')),
              //         DataColumn(label: Text('Phone No.')),
              //         DataColumn(label: Text('View'))
              //       ],
              //       rows: dataRows,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.amber,
                            child: Text(value[index]["name"])),
                        Container(
                            color: Colors.amber,
                            child: Text(value[index]["phone_no"])),
                        Container(
                            color: Colors.amber,
                            child: Text(value[index]["time"])),
                        Container(
                            color: Colors.amber,
                            child: Text(value[index]["token_no"])),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          _isloading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Opacity(
                      opacity: .8,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
