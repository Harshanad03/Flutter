// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pn/postData.dart';

class GetMemberDetails extends StatefulWidget {
  const GetMemberDetails({super.key});

  static const routeName = "/memberDetailsPage";

  @override
  State<GetMemberDetails> createState() => _GetMemberDetailsState();
}

class _GetMemberDetailsState extends State<GetMemberDetails>
    with AutomaticKeepAliveClientMixin<GetMemberDetails> {
  @override
  bool wantKeepAlive = true;
  // final _controller = TextEditingController();

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    // TextEditingController(),
    // TextEditingController(),
  ];

  List<String> hintTxt = [
    'First Name\t *',
    'Second Name\t *',
    "Gender\t *",
    'Phone Number\t *',
    'Address\t *',
    'Pincode\t *',
    // 'Work Details (type of work) :\t *',
    'Mail Id\t*',
    'Date of Birth\t *',
    // 'Education',
    'Blood group',
    'Enter Your New Id\t *',
    'Enter Your New password\t *',
  ];

  void showFailAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Please fill all the boxes marked (*)."),
      actions: [
        ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Request Submitted"),
      content: Text("Admin will accept your request"),
      actions: [
        ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    Navigator.pop(context);
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .82,
                    child: ListView.builder(
                        itemCount: controllers.length,
                        itemBuilder: (context, index) {
                          return txtFied(
                            controllers[index],
                            hintTxt[index],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              final Map<String, String> object = {
                                "type": "Member Register",
                                "1st_name": controllers[0].text,
                                "2nd_name": controllers[1].text,
                                "gender": controllers[2].text,
                                "phone_no": controllers[3].text,
                                "address": controllers[4].text,
                                "pincode": controllers[5].text,
                                // "type of work": controllers[6].text,
                                "mail Id": controllers[6].text,
                                "date_of_birth": controllers[7].text,
                                // "educational_qualification":
                                //    controllers[9].text,
                                "blood_group": controllers[8].text,
                                'id': controllers[9].text,
                                'password': controllers[10].text,
                              };
                              // print(object.toString());
                              if (controllers[0].text != "" &&
                                  controllers[1].text != "" &&
                                  controllers[2].text != "" &&
                                  controllers[3].text != "" &&
                                  controllers[4].text != "" &&
                                  controllers[5].text != "" &&
                                  //   controllers[6].text != "" &&
                                  controllers[6].text != "" &&
                                  controllers[7].text != "" &&
                                  controllers[10].text != "") {
                                print("this wrk");
                                final response = await postData(
                                  "/addlogindata",
                                  jsonBody: object,
                                ).then((value) {
                                  setState(() {
                                    showAlertDialog(context);
                                    controllers[0].clear();
                                    controllers[1].clear();
                                    controllers[2].clear();
                                    controllers[3].clear();
                                    controllers[4].clear();
                                    controllers[5].clear();
                                    //  controllers[6].clear();
                                    controllers[6].clear();
                                    controllers[7].clear();
                                    //   controllers[9].clear();
                                    controllers[8].clear();
                                    controllers[9].clear();
                                    controllers[10].clear();
                                    _isLoading = false;
                                    Navigator.pop(context);
                                  });
                                });
                                print(response.toString());
                                print(object.toString());
                              } else {
                                print("his wrk$object");
                                showFailAlertDialog(context);
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (_isLoading)
                Container(
                  child: Center(
                    child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: Colors.pink,
                        rightDotColor: Colors.red,
                        size: 50),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget txtFied(controller, hintTxt) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    margin: EdgeInsets.only(left: 30, right: 30),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hintTxt,
        hintStyle: TextStyle(color: Color.fromARGB(255, 217, 28, 28)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
