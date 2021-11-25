
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController val = new TextEditingController();

String from = 'BRL';
String to = 'USD';
double inf = 0;
Convert() async {  
  String url = 'https://economia.awesomeapi.com.br/json/last/' + from + '-' + to;

  http.Response ans = await http.get(Uri.parse(url));

  Map<String, dynamic> back = json.decode(ans.body);
  String cv = back["ask"];
  setState(() {
    inf = (val as double)*double.parse(cv);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: body()
    );
  }

  title(){
    return AppBar(
      title: Text('WallStreet', style: TextStyle(fontSize:20, color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.deepPurple
    );
  }

  body(){
    return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      height: 580,
      child: Column(
        children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:tf(TextInputType.number, val, 'Valor')),
        Row(children: <Widget>[
          Container(
          width: 100,
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:db(from, (String? att) {setState((){from = att!;});},<String>['BRL', 'USD', 'BTC'])),
          Container(
          width: 100,
          height: 50,
          margin: EdgeInsets.fromLTRB(60, 0, 20, 20),
          child:db(to, (String? att) {setState((){to = att!;});},<String>['USD', 'BRL', 'BTC']))
        ]),
        Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:bt()),
        Container(
          width: 300,
          height: 200,
          color: Colors.red,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text('$inf',
          style: TextStyle(fontSize:17, color: Colors.black, fontWeight: FontWeight.bold))
        )
        ]
      )
    ));
  }

  db(vl, chg, lst) {
    return DropdownButton<String>(
      value: vl,
      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurple,
      ),
      onChanged: chg,
      items: lst
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  bt(){
    return ElevatedButton(
      child: Text('Converter', style: TextStyle(fontSize:20, color: Colors.white)),
      onPressed: Convert,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromRadius(double.maxFinite)),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple))
    );
  }

  tf(keyType, controll, txt){
    return TextField(
      keyboardType: keyType,
      controller: controll,
      decoration: InputDecoration(
        labelText: txt,
        labelStyle: TextStyle(color: Colors.deepPurple)),
      style: TextStyle(color: Colors.deepPurple, fontSize:20)
    );
  }
}