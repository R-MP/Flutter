import 'package:flutter/material.dart';
import 'about.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.white,
      body: body(context)
    );
  }

  title(){
    return AppBar(
      title: 
      Text('DuckBank',
      style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      backgroundColor: Colors.deepOrange[300],
      centerTitle: true,
    );
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        pad(row(
          txt('Nome:', 25, Colors.deepOrange),
          tf(name),
          ),0,20,0,0),
         ]
        ),
       ],
      ),    
     );
  }

  row(con,cont){
    return Row(children: <Widget>[
      con,
      cont,
    ]);
  }

  pad(context, double l, double t, double r, double b){
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: context,

    );
  }

  txt(content, double size, color){
  return Text(
    content,
    style: TextStyle(fontSize: size, color: color)
  );
  }

  tf(controll) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controll,
      decoration: InputDecoration(
        hintText: 'aaaaaaa',
        hintStyle: TextStyle(fontSize: 25, color: Colors.orange),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    );
  }

}

