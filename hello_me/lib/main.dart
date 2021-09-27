import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:ui' as ui;

void main() => runApp(hello_me());

class hello_me extends StatelessWidget {
  const hello_me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var ui;
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello World'),
          ),
          body: Container(
            color: Colors.white,
            child: Center(
              child: Text(
                'Im Testing',
                style: TextStyle(
                    fontSize: 75,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.workspaces_outline, color: Colors.white),
            backgroundColor: Colors.red,
          ),
        ));
  }
}
