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

  String result = '';

  void _mult() {
    setState(() {
      double a = double.parse(x.text);
      double b = double.parse(y.text);

      double res = a * b;
      result = 'Resp .: $res';
    });
  }

  @override
  Widget build(BuildContext context) => _Construct(x, y, result, _mult);
}

// ignore: non_constant_identifier_names
_Construct(var1, var2, var3, class1) {
  return Scaffold(
    appBar: AppBar(title: _Title(), backgroundColor: Colors.red),
    drawer: _Drawer(),
    body: _Body(var1, var2, var3, class1),
  );
}

// ignore: non_constant_identifier_names
_Title() {
  return Text(
    'Multiplicação',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );
}

// ignore: non_constant_identifier_names
_Drawer() {
  return Image.network(
      'https://cdn.discordapp.com/attachments/574428204165758979/883069898123804683/GatinMatematico.png');
}

// ignore: non_constant_identifier_names
_Body(var1, var2, var3, class1) {
  return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _Field('Insira o primeiro número', var1),
            _Field('Insira o segundo número', var2),
            _Button(class1),
            _Text(var3)
          ]));
}

// ignore: non_constant_identifier_names
_Field(InputText, objControll) {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: InputText, labelStyle: TextStyle(color: Colors.black)),
    style: TextStyle(color: Colors.black, fontSize: 25),
    controller: objControll,
  );
}

// ignore: non_constant_identifier_names
_Button(code) {
  return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      child: Container(
          // ignore: deprecated_member_use
          child: RaisedButton(
              onPressed: code,
              color: Colors.red,
              child: Text('Calcular',
                  style: TextStyle(color: Colors.white, fontSize: 40)))));
}

// ignore: non_constant_identifier_names
_Text(fin) {
  return Text('$fin', style: TextStyle(color: Colors.black, fontSize: 30));
}
