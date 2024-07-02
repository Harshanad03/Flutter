import 'package:digiken/last_people.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Peoplelogin extends StatelessWidget {
  static const routeName = "/peoplelogin";

  const Peoplelogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Digiken',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 113, 19, 128),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 17, 135, 195),
          Color.fromARGB(255, 126, 23, 144),
          Color.fromARGB(255, 126, 6, 112)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 34,
                      ),
                      Icon(Icons.person),
                      Text('Username'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 36,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        color: Color.fromARGB(255, 225, 229, 232),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: ('Enter your Username'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 34,
                      ),
                      Icon(Icons.lock),
                      Text('Password'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 36,
                      ),
                      Container(
                          height: 40,
                          width: 250,
                          color: Color.fromARGB(255, 225, 229, 232),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: ('Enter your password'),
                              suffixIcon: Icon(Icons.visibility),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Peopleloginlast.routeName);
                },
                child: SizedBox(
                  height: 55,
                  width: 100,
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
