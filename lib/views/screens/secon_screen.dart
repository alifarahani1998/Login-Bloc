import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('third screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/third_screen');
            },
          ),
        ),
      ),
    );
  }
}
