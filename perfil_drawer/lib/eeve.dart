import 'package:flutter/material.dart';
 
class Eeve extends StatelessWidget {
  const Eeve({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child:Container(
      height: 500,
      width: 500,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://media1.giphy.com/media/3Wv2Mfxh3Lf2M8eq9z/giphy.gif')
      )
    ));
  }
}
