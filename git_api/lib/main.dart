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
TextEditingController user = new TextEditingController();
String inf = '';
String avatar = 'https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU';

findMe() async {  
  String url = 'https://api.github.com/users/${user.text}';

  http.Response ans = await http.get(Uri.parse(url));

  Map<String, dynamic> back = json.decode(ans.body);
  String avatar_url = back["avatar_url"];

  String name = back['name'];
  int id = back['id'];
  String res = back['repos_url'];
  int followers = back['followers'];
  int following = back['following'];
  String created = back['created_at'];

  setState(() {
    avatar = '$avatar_url';
    inf = 'Nome: $name \nID: $id \nRepositórios: $res \nSeguidores: $followers \nSeguindo: $following \nCriado em $created';
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
      title: Text('Hub View', style: TextStyle(fontSize:20, color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.black
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
          height: 200,
          width: 200,
          child: img()
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:tf(TextInputType.text, user, 'Login')),
        Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:bt()),
        Container(
          width: 300,
          height: 200,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(inf,
          style: TextStyle(fontSize:17, color: Colors.black, fontWeight: FontWeight.bold))
        )
        ]
      )
    ));
  }

  img(){
    return Image.network(avatar);
  }

  bt(){
    return ElevatedButton(
      child: Text('Encontrar', style: TextStyle(fontSize:20, color: Colors.white)),
      onPressed: findMe,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromRadius(double.maxFinite)),
        backgroundColor: MaterialStateProperty.all(Colors.black))
    );
  }

  tf(keyType, controll, txt){
    return TextField(
      keyboardType: keyType,
      controller: controll,
      decoration: InputDecoration(
        labelText: txt,
        labelStyle: TextStyle(color: Colors.black)),
      style: TextStyle(color: Colors.black, fontSize:20)
    );
  }
}