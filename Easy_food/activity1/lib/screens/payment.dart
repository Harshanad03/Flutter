// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var _selectedItem;
  var _selectedItem2;
  List items2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
  List items = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.end,
        reverse: true,
        children: [
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            elevation: 0,
            color: Color.fromARGB(212, 245, 207, 125),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "\$12.00",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 190,
                    width: 280,
                    padding: EdgeInsets.all(8),
                    color: Color.fromARGB(255, 239, 82, 34),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.qr_code_scanner,
                            size: 90,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Scan Your Card",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    "Card Number",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    child: TextField(
                        cursorColor: Colors.black,
                        decoration: textfieldstyles(
                            lable: "Your Card Number",
                            hint: "Enter Your Card Number")),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Expiry Date",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      //   width: 150,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 20),
                        child: Text(
                          "CVV/CVC",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          height: 50,
                          width: 80,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButton<String>(
                              elevation: 10,
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              value: _selectedItem,
                              onChanged: (item) {
                                setState(() {
                                  _selectedItem = item;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          height: 50,
                          width: 80,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                              ),
                              items: items2
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              value: _selectedItem2,
                              onChanged: (item) {
                                setState(() {
                                  _selectedItem2 = item;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          width: 100,
                          child: TextField(
                              cursorColor: Colors.black,
                              decoration: textfieldstyles(
                                  lable: "cvv", hint: "Enter cvv")),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    "Card Holder Name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    child: TextField(
                        cursorColor: Colors.black,
                        decoration: textfieldstyles(
                            lable: "Card Holder Name",
                            hint: "Enter Your Name")),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.all(14.0),
                        //maximumSize: Size(200, 50),
                        backgroundColor: Color.fromARGB(255, 239, 82, 34),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50.0, vertical: 1.0),
                      child: Text(
                        "PAY",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget expiry() {
    return SizedBox(
      width: 100,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 40,
                )),
            border: OutlineInputBorder(),
            // labelText: "Your Card Number",
            hintText: ""),
      ),
    );
  }
}

textfieldstyles({hint, lable}) {
  return InputDecoration(
    focusColor: Colors.black,
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: Colors.black),
    ),
    labelText: lable,
    labelStyle: TextStyle(color: Colors.black),
    hintText: hint,
  );
}
