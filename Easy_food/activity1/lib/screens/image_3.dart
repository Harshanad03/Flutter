import 'package:flutter/material.dart';

class Image3 extends StatelessWidget {
  const Image3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 400,
              width: double.infinity,
              child: Image.network(
                  "https://media.istockphoto.com/id/1300476665/photo/high-angle-view-asian-chinese-womans-hand-on-mobile-app-for-online-food-delivery-during.jpg?s=612x612&w=0&k=20&c=4LkbammKgGvw3_xHYz_YZLdo_7zjeUCeDTC3pnGDUBE="),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  "Get started on ordering",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your food",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Get your favourite meals deliverd to your",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "doorstep for free with our online food delivery",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "app-enjoy a whole month of complimentary",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "delivery!",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Next',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom( iconColor: Colors.orange,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
