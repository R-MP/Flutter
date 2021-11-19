import 'package:flutter/material.dart';

class Init extends StatelessWidget {
  const Init({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
      height: 500,
      width: 500,
      child: Image(
        fit: BoxFit.contain,
        image: NetworkImage('https://media4.giphy.com/media/3oEduNbWK3rUWBqlkk/giphy.gif?cid=ecf05e47iroiczjwmciecrgh18pssegoazg3b5bz65uo9fdd&rid=giphy.gif&ct=g')
      )
    ));
  }
}