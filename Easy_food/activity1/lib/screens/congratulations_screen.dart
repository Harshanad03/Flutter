import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(140),
              child: Image(
                fit: BoxFit.fill,
                height: 250,
                width: 250,
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQW7SRlmV7dr1qZ9CoS3j9wl8TXzruEx6r0A&usqp=CAU"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Congratulations",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.orange.shade800,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Your Payment is Successful",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
