import 'package:flutter/material.dart';

void main()=>executarApp;

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext contexto) {
    return MaterialApp(
      title: 'Demo do Flutter',
      theme: ThemeData(
        primarySwatch: Cores_azul,
      ),
      home: MinhaPaginaInicial(title: 'Pagina inicial da demo do Flutter'),
    );
  }
}

class MinhaPaginaInicial extends StatefulWidget {
  MinhaPaginaInicial({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MinhaPaginaInicialState createState() => _MinhaPaginaInicialState();
}

class _MinhaPaginaInicialState extends State<MinhaPaginaInicial> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você apertou esse botão:',
            ),
            Text(
              '$_contador vezes',
              style: Theme.of(contexto).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarContador,
        tooltip: 'Incrementar',
        child: Icon(Icons.add),
      ),
    );
  }
}
var executarApp = runApp(MeuApp());
var Cores_azul = Colors.blue;
