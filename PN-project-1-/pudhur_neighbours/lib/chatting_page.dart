// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pn/get_data.dart';
import 'package:pn/member/member.dart';
import 'package:pn/postData.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({required this.myName, super.key});
  final String myName;
  static const routeName = "/chattingpage";
  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage>
// with AutomaticKeepAliveClientMixin<ChattingPage>
{
  final TextEditingController _controller = TextEditingController();
  late WebSocketChannel _channel;
  List<dynamic> _messages = [];
  bool _isLoading = true;

  _getData() async {
    final response = await getData("/messages");
    setState(() {
      _messages = response;
      _isLoading = false;
    });
  }

  _sendMessage(mes) async {
    final response = await postData("/savemessages", jsonBody: {
      "sender": Member.username,
      "message": mes,
      "time": DateFormat.jm().format(DateTime.now()).toString()
    });
  }

  final ScrollController scroll = ScrollController();
  void scorllDown() {
    scroll.jumpTo(scroll.position.maxScrollExtent);
  }

  @override
  void initState() {
    _getData();
    super.initState();
    const String url = 'ws://54.252.168.227:8000/ws/chat_room/groupchat';
    _channel = IOWebSocketChannel.connect(url);
    _channel.stream.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'chat') {
        setState(() {
          final wsmes = {
            "sender": data['name'],
            "message": data['message'],
            "time": DateFormat.jm().format(DateTime.now()).toString()
          };
          // final messageText = '${data['name']}: ${data['message']}';
          _messages.add(wsmes);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Message"),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              controller: scroll,
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 166, 139),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_messages[index]["sender"] + ":"),
                        Text("\t\t" + _messages[index]["message"]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(_messages[index]["time"]),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Opacity(
                      opacity: .8,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: LoadingAnimationWidget.twistingDots(
                            leftDotColor: Colors.pink,
                            rightDotColor: Colors.red,
                            size: 50),
                      ),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 50.0,
            right: 15.0,
            child: IconButton(
              onPressed: scorllDown,
              icon: const Icon(
                Icons.keyboard_double_arrow_down_sharp,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter a message',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.black54,
                  ),
                  shape: MaterialStatePropertyAll(
                    CircleBorder(),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(10),
                  ),
                ),
                onPressed: _controller.text == ""
                    ? () {}
                    : () async {
                        final message = _controller.text;
                        _channel.sink.add(json.encode({
                          'name': Member.username,
                          'message': message,
                        }));
                        final mes = {
                          "message": message,
                          "sender": Member.username,
                          "time":
                              DateFormat.jm().format(DateTime.now()).toString(),
                        };
                        final respon = await postData(
                          "/savemessages",
                          jsonBody: mes,
                        ).then((value) {
                          setState(() {
                            scorllDown();
                            _controller.clear();
                          });
                        });
                        // final res = await http
                        //     .post(
                        //         Uri.parse(
                        //             "https://nvp1-12d2d-default-rtdb.firebaseio.com/chat/groupchat.json"),
                        //         body: json.encode(mes))
                      },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton:
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();
}
