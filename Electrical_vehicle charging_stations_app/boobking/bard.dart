import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/search/search.dart';

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
                  _additionProcess(context);
                },
                child: Text('Go Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _additionProcess(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => MyApp(),
        isScrollControlled: true);
  }
}
