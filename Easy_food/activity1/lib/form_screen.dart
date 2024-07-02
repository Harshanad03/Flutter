// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen({super.key});

  bool passToggle = true;
  bool signUpToggle = true;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  final _formfield = GlobalKey<FormState>();
  final _formfield2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final sigUppassController = TextEditingController();

  bool emailValid = true;
  late TabController _tabController = TabController(vsync: this, length: 2);
  @override
  void initState() {
    super.initState();
    //  _tabController = new TabController(vsync: this,length: myTabs.length);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        toolbarHeight: 225,
        backgroundColor: Colors.orangeAccent,
        // flexibleSpace: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       '
        //
        //
        // '),
        // fit: BoxFit.fill)),
        // ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: ('login'),
            ),
            Tab(
              text: ('signup'),
            )
          ],
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Form(
                    key: _formfield,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (emailcontroller) {
                            if (RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                                .hasMatch(emailcontroller!)) {
                              return null;
                            } else {
                              return 'Enter a valid email';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (pass) {
                            if (pass!.length < 8) {
                              return 'Enter 8 digit password';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          obscureText: widget.passToggle,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  widget.passToggle = !widget.passToggle;
                                });
                              },
                              child: Icon(widget.passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        InkWell(
                          onTap: () {
                            if (_formfield.currentState!.validate()) {
                              print("Success");
                              emailController.clear();
                              passController.clear();
                            } else {
                              print("enter mail and pass");
                            }
                          },
                          child: Center(
                            child: Card(
                              color: Color.fromRGBO(138, 224, 239, 0.871),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),

          ///this is the part for sign up
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Form(
                    key: _formfield2,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (emailcontroller) {
                            if (RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                                .hasMatch(emailcontroller!)) {
                              return null;
                            } else {
                              return 'Enter a valid email';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            labelContent: "password",
                            toggle: widget.passToggle,
                            controller: passController,
                            context: context),
                        CustomTextField(
                            labelContent: "re-enter password",
                            toggle: widget.signUpToggle,
                            controller: sigUppassController,
                            context: context),
                        SizedBox(height: 60),
                        InkWell(
                          onTap: () {
                            if (_formfield.currentState!.validate()) {
                              print("Success");
                              emailController.clear();
                              passController.clear();
                              sigUppassController.clear();
                            } else {
                              // showDialog(
                              //     context: context,
                              //     builder: (_) {
                              //       return SizedBox(
                              //         height: 100,
                              //         width: 100,
                              //         child: Card(
                              //           child: Column(
                              //             children: [
                              //               Text("Pass mis match"),
                              //               ElevatedButton(
                              //                   onPressed: () =>
                              //                       Navigator.of(context).pop(),
                              //                   child: Text("close"))
                              //             ],
                              //           ),
                              //         ),
                              //       );
                              //     });
                              print("enter mail and pass");
                            }
                          },
                          child: Center(
                            child: Card(
                              color: Color.fromRGBO(138, 224, 239, 0.871),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
    );
  }

  Widget CustomTextField(
      {controller,
      required bool toggle,
      required BuildContext context,
      labelContent}) {
    return TextFormField(
      validator: (pass) {
        if (pass!.length < 8) {
          return 'Enter 8 digit password';
        } else if (sigUppassController.text != passController.text) {
          return 'pasword mismatch';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      obscureText: toggle,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIconColor: Colors.amber,
        suffixIconColor: Colors.amber,
        labelText: labelContent,
        labelStyle: TextStyle(
          color: Colors.amber,
        ),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.green,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              // toggle = !toggle;
              labelContent == "password"
                  ? widget.passToggle = !toggle
                  : widget.signUpToggle = !toggle;
              print(toggle.toString());
            });
          },
          child: Icon(toggle ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
//github setup