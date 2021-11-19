import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool nightMode = false;
  bool smtxt = false;

  double fsize = 25.0;

  Color varBlack = Colors.black;
  Color varWhite = Colors.white;

  @override
  void initState() { 
    super.initState();
    getSaved();
  }
 
  getSaved() async{
    SharedPreferences config = await SharedPreferences.getInstance();
    bool? nightValue = config.getBool("nKey");
    bool? sizeValue = config.getBool("sKey");
    if(nightValue != null && nightValue != nightMode){
    nightMode = nightValue;
    setState(() {
      nightBringer();
    });}
    if(sizeValue == true) fsize = 15;
    if(sizeValue == false) fsize = 25;
  }

  setSaved() async{
    SharedPreferences config = await SharedPreferences.getInstance();
    await config.setBool('nKey', nightMode);
    
    await config.setBool('sKey',smtxt);
    
  }


  nightBringer() {  
  setState(() {
    if(nightMode==false){
      varBlack = Colors.black;
      varWhite = Colors.white;
      }
    if(nightMode==true){
      varBlack = Colors.white54;
      varWhite = Colors.black87;
      }
      setSaved();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: body(),
    );
  }

  title(){
    return AppBar(
      title: Text('Visualize It', style: TextStyle(color: varWhite)),
      backgroundColor: Colors.orange[300],
    );
  }

  body(){
    return Container(
      color: varWhite,
      child: Column(
        children: <Widget>[
          pad(0,10,0,0),
          options(),
          pad(0,10,0,0),
          cont(),
        ],
      )
    );
  }

  options(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      opTxt('Night Mode'),
      nswt(),
      pad(10,0,10,0),
      opTxt('Small Text'),
      tswt(),
      ],
    );
  }

  cont(){
    return Container(
          height: 400, width: 320,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            border: Border.all(color: varBlack, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
          child: SingleChildScrollView(child:lyric())  
          );
  }

  opTxt(txt){
    return Text(txt,
    style: TextStyle(
      fontSize: 17.5,
      fontWeight: FontWeight.bold,
      color: varBlack,
    ));
  }

  pad(double L, double T, double R, double B){
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B)
    );
  }

  nswt(){
    return Switch(
      value: nightMode,
      onChanged: (value){
        setState(() {
          nightMode = value;
          nightBringer();
        });
      },
      activeTrackColor: Colors.orange[300],
      inactiveTrackColor: Colors.grey,
      activeColor: Colors.grey[200],
      inactiveThumbColor: Colors.grey[200],
    );
  }

  tswt(){
    return Switch(
      value: smtxt,
      onChanged: (value){
        setState(() {
          smtxt = value;

          if(smtxt == true){
            fsize = 15.0;
          }
          if(smtxt == false){
            fsize = 25.0;
          }
          setSaved();
        });
      },
      activeTrackColor: Colors.orange[300],
      inactiveTrackColor: Colors.grey,
      activeColor: Colors.grey[200],
      inactiveThumbColor: Colors.grey[200],
    );
  }

  lyric(){
    return Text(
      "Can't count the years on one hand \nThat we've been together \nI need the other one to hold you \nMake you feel, make you feel better \n\nIt's not a walk in the park to love each other \nBut when our fingers interlock \nCan't deny, can't deny you're worth it \n‘Cause after all this time \nI'm still into you \n\nI should be over all the butterflies \nBut I'm into you (I'm into you) \nAnd, baby, even on our worst nights \nI'm into you (I'm into you) \nLet 'em wonder how we got this far \n‘Cause I don't really need to wonder at all \nYeah, after all this time \nI'm still into you \n\nRecount the night that I first met your mother \nAnd on the drive back to my house \nI told you that, I told you that I loved you \nYou felt the weight of the world \nFall off your shoulder \nAnd to your favorite song we sang along \nTo the start of forever \nAnd after all this time \nI'm still into you \n\nI should be over all the butterflies \nBut I'm into you (I'm into you) \nAnd, baby, even on our worst nights \nI'm into you (I'm into you) \nLet 'em wonder how we got this far \n‘Cause I don't really need to wonder at all \nYeah, after all this time \nI'm still into you \n\nSome things just \nSome things just make sense \nAnd one of those is you and I \nSome things just \nSome things just make sense \nAnd even after all this time \n\nI'm into you \nBaby, not a day goes by \nThat I'm not into you \n\nI should be over all the butterflies \nBut I'm into you (I'm into you) \nAnd, baby, even on our worst nights \nI'm into you (I'm into you) \nLet 'em wonder how we got this far \n‘Cause I don't really need to wonder at all \nYeah, after all this time \nI'm still into you \nI'm still into you \nI'm still into you",
      style: TextStyle(fontSize: fsize, color: varBlack));
  }
}