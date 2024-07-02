import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Addition App'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _result = 0;

  void _additionProcess(int value) {
    setState(() {
      _result += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'TEAM A',
              ),
              SizedBox(
                height: 5,
              ),
              Text('RESULT'),
              Text(
                '$_result',
                //style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(1);
                },
                child: Text('1'),
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(4);
                },
                child: Text('4'),
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(6);
                },
                child: Text('6'),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'TEAM B',
              ),
              SizedBox(height: 5),
              Text('RESULT'),
              Text(
                '$_result',
                //style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(1);
                },
                child: Text('1'),
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(4);
                },
                child: Text('4'),
              ),
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(6);
                },
                child: Text('6'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
