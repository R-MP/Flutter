import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController peso = new TextEditingController();
  TextEditingController alt = new TextEditingController();
  String rsp = "";
  String cats = "";
  String img =
      'https://cdn.discordapp.com/attachments/574428204165758979/890993185852108800/GrauIIIPeso.png';

  void calculate() {
    setState(() {
      double p = double.parse(peso.text);
      double a = double.parse(alt.text);

      if (a > 100) {
        a = a / 100;
      }

      double imc = p / (a * a);

      if (imc < 18.5) {
        rsp = "Abaixo do Peso";
        cats = "Você tem apenas dois gatinhos ; -;";
        img =
            'https://cdn.discordapp.com/attachments/574428204165758979/890992155093524490/AbaixoPeso.png';
      } else if (imc < 25) {
        rsp = "Peso Normal";
        cats = "Você tem 3 gatinhos! Essa é a quantidade ideal!";
        img =
            'https://cdn.discordapp.com/attachments/574428204165758979/890992177809883196/NormalPeso.png';
      } else if (imc < 30) {
        rsp = "Sobrepeso";
        cats = "Parece que você tem um gatinho a mais...";
        img =
            'https://cdn.discordapp.com/attachments/574428204165758979/890992196050903100/SobrePeso.png';
      } else if (imc < 35) {
        rsp = "Obesidade Grau I";
        cats = "Cuidado, muitos gatinhos podem fazer mal para saúde!";
        img =
            'https://cdn.discordapp.com/attachments/574428204165758979/890992213025255504/GrauIPeso.png';
      } else if (imc < 40) {
        rsp = "Obesidade Grau II";
        cats = "Quantos gatinhos! Por favor tome mais cuidado com eles";
        img =
            "https://cdn.discordapp.com/attachments/574428204165758979/890992229634695168/GrauIIPeso.png";
      } else {
        rsp = "Obesidade Grau III";
        cats = "Meu Deus, você precisa parar de adotar gatinhos imediatamente!";
        img =
            'https://cdn.discordapp.com/attachments/574428204165758979/890992241965957210/GrauIIIPeso.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  header() {
    return AppBar(
        title: Text(
          'IMC',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[300]);
  }

  body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: <Widget>[
          image(img),
          row(),
          button(),
          answer(rsp, 30),
          answer(cats, 10),
        ],
      ),
    );
  }

  image(imag) {
    return Image.network(
      imag,
      height: 300,
      width: 300,
      fit: BoxFit.cover,
    );
  }

  container(content) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 80,
      width: 150,
      child: content,
    );
  }

  textfield(String field, controll) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controll,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: field,
        hintStyle: TextStyle(fontSize: 20),
      ),
    );
  }

  row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        container(textfield("Peso", peso)),
        container(textfield("Altura", alt)),
      ],
    );
  }

  button() {
    return Container(
      height: 50,
      width: 280,
      child: ElevatedButton(
          onPressed: calculate,
          child: Text(
            'Verificar Peso',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow[300]),
          )),
    );
  }

  answer(content, double size) {
    return Text(content, style: TextStyle(fontSize: size));
  }
}
