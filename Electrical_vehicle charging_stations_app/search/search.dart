import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 76, 75, 75),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 141, 66),
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text(
            "Search",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel),
              color: Colors.black,
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the submit action here
                      print(
                        'Submit button pressed!',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Color.fromARGB(255, 45, 141, 66), // Text color
                    ),
                    child: Text(
                      'Hotel with station',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Malls with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Theaters with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Marriage halls with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Home with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'College with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Factories with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Companies with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Hospital with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Add some spacing between buttons
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the next action here
                      print('Next button pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 45, 141, 66),
                    ),
                    child: Text(
                      'Stores with stations',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
        ),
      );
    }
}