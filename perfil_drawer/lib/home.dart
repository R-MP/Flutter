import 'package:flutter/material.dart';
import 'init.dart';
import 'umb.dart';
import 'eeve.dart';
import 'mew.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;

  // ignore: non_constant_identifier_names
  final tab_list = [
    
    Init(),
    Umb(),
    Eeve(),
    Mew(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: tab_list[current],
      drawer: drawer(),
    );
  }

  title(){
    return AppBar(
      title: Text("PokeDrawer"),
      backgroundColor: Colors.red,
    );
  }

  drawer(){
    return 
    Theme(
    data: Theme.of(context).copyWith(canvasColor: Colors.redAccent),
    child:Drawer(
        child: ListView(
        children: [
          circle(),
          list('Home','First',Icons.ac_unit,0),
          list('Umbreon','Second', Icons.access_alarm,1),
          list('Eeve','Third', Icons.accessibility,2),
          list('Mewtwo','Fourth', Icons.backpack,3)
        ],
      )
    ),
    );
  }

  circle(){
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/51odnTPvQHL.png')
        )
      )
    );
  }

  list(title, sub, icon, c){
    return ListTile(
            title: Text(title),
            subtitle: Text(sub),
            trailing: Icon(icon),
            onTap: (){
              setState(() {
                Navigator.pop(context);
                current = c;
              });
            },
          );
  }
}

