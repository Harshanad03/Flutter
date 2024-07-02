import 'package:demo/chats.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff075e54),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text('WhatsApp'),
        backgroundColor: Color(0xff075e54),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
            icon: Icon(Icons.groups),
          ),
          Tab(
            text: ('Chats'),
          ),
          Tab(
            text: ('Status'),
          ),
          Tab(
            text: ('Calls'),
          ),
        ]),
      ),
      body: TabBarView(controller: _controller, children: [
        Tab(
          text: 'Start your communities',
        ),
        Chats(),
        Tab(
          text: 'Get start',
        ),
        Tab(
          text: 'Make a Call',
        ),
      ]),
    );
  }
}
