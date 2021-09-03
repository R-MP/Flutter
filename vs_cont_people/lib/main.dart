import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int x = 00;
  String fin = '';

  // ignore: non_constant_identifier_names
  void _CallPos() {
    setState(() {
      x++;
    });
  }

  // ignore: non_constant_identifier_names
  void _CallNeg() {
    setState(() {
      x--;
      if (x < 0) x = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Title(),
      backgroundColor: Colors.white,
      body: _CountSquare(x, _CallPos, _CallNeg),
    );
  }
}

// ignore: non_constant_identifier_names
_Title() {
  return AppBar(
    title: Text('Quantas pessoas tem aqui?',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20)),
    centerTitle: true,
    backgroundColor: Colors.red,
  );
}

// ignore: non_constant_identifier_names
_CountSquare(number, callpos, callneg) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            width: 360,
            height: 515,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('$number',
                    style: TextStyle(color: Colors.black, fontSize: 100)),
                _PlusMinusSquares(callpos, callneg)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
_PlusMinusSquares(callpos, callneg) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[_PlusSquare(callpos), _MinusSquare(callneg)]);
}

// ignore: non_constant_identifier_names
_PlusSquare(call) {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
          width: 80,
          height: 80,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: call,
            child:
                Text('+', style: TextStyle(color: Colors.white, fontSize: 50)),
            color: Colors.green,
          )));
}

// ignore: non_constant_identifier_names
_MinusSquare(call) {
  return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Container(
          width: 80,
          height: 80,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: call,
            child:
                Text('-', style: TextStyle(color: Colors.white, fontSize: 50)),
            color: Colors.red,
          )));
}
