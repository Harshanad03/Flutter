import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NV"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person1")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person2")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person3")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person4")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person5")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person6")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person7")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person8")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person9")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person10")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 11,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person1")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person12")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person13")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person14")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person15")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(),
                Title(color: Colors.black, child: Text("person16")),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
