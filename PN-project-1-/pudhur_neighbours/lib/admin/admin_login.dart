import 'package:flutter/material.dart';
import 'package:pn/admin/admindash.dart';
import 'package:pn/member/member.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'AdminLogin !',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.only(left: 65, right: 65),
              child: TextFormField(
                validator: (id) {
                  if (id != 'admin' && id != 'Saranesh') {
                    return 'Enter a Valid ID';
                  } else {
                    return null;
                  }
                },
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'User ID',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 217, 28, 28)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.only(left: 65, right: 65),
              child: TextFormField(
                validator: (pass) {
                  if (pass != '12345') {
                    return 'Incorrect password';
                  } else
                    return null;
                },
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 217, 28, 28)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xff4c505b),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Member.username = "Admin";
                        Navigator.popAndPushNamed(context, Admindash.routeName);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
