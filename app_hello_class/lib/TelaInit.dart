import 'dart:ui';

import 'package:flutter/material.dart';

class TelaInit extends StatelessWidget {
  const TelaInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Opa, e ai?'),
       centerTitle: false,),
      body: Container(
       color: Colors.lightBlueAccent,
       child: Center(
         child: Text("Só vamo!",
             style: TextStyle(
               fontSize: 50,
               fontWeight: FontWeight.bold,
               fontStyle: FontStyle.italic,
               decoration: TextDecoration.combine([TextDecoration.underline,TextDecoration.overline]),
               decorationStyle: TextDecorationStyle.solid,
               color: Colors.white,
             )),
       ),),
      drawer: Container(
       color: Colors.pink),
      floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
