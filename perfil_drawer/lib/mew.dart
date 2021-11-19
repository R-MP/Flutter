import 'package:flutter/material.dart';
 
class Mew extends StatelessWidget {
  const Mew({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child:Container(
      height: 300,
      width: 800,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://media2.giphy.com/media/8Ps9NIsFFmo5esFuWx/giphy.gif')
      )
    ));
  }
}
