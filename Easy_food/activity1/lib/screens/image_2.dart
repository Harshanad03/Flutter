import 'package:flutter/material.dart';

class Image2 extends StatelessWidget {
  const Image2({super.key});

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
                  "https://media.istockphoto.com/id/1262331996/photo/the-staff-prepares-the-delivery-box-on-the-motorcycle-for-delivery-to-customers.jpg?s=612x612&w=0&k=20&c=tvSWn2CvoZ_jKbkBsHRFKrB-FiGlCgpeWA79myIYWiY="),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  "Free delivery for",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "One month",
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
