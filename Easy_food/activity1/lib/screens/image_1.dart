import 'package:flutter/material.dart';

class Image1 extends StatelessWidget {
  const Image1({super.key});

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
                  "https://v7a4q7y5.rocketcdn.me/wp-content/uploads/2021/11/Air-Fryer-Chicken-Leg-Quarters3-735x1103.jpg"),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  "Wide range of Food",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Categories & more",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Browse through our extensive list of",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "restaurants and dishes, and when you are",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "ready to order, simply add your desired items",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  "to your cart and checkout. It's that easy!",
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
            style: ElevatedButton.styleFrom(
              iconColor: Colors.orange,
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
