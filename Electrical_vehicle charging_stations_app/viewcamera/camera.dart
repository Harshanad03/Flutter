import 'package:flutter/material.dart';

void main() {
  runApp(Mycamera());
}

class Mycamera extends StatelessWidget {
  const Mycamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column( // Wrap in a Column widget
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _additionProcess(4);
                },
                child: Text('Click to view Allocated Slot'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _additionProcess(int value) {
    // Your addition process logic here;
  }
}
