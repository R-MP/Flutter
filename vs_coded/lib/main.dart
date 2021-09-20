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
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();

  String answer = '';
  void _calc() {
    setState(() {
      double a = double.parse(x.text);
      double b = double.parse(y.text);

      double sum = a + b;

      answer = '$sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Primeiro aq',
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25),
              controller: x,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Segundo aq',
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25),
              controller: y,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: _calc,
                  child: Text('=',
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  color: Colors.red,
                ),
              ),
            ),
            Text(answer,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 40))
          ],
        ),
      ),
    );
  }
}
