import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.purple[300],
      body: body(),
    );
  }

  title() {
    return AppBar(
      title: Text(
        'Anuncios',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          carousel(),
        ],
      ),
    );
  }

  image(link) {
    return Image.network(
      link,
      width: 250,
      height: 150,
      fit: BoxFit.cover,
    );
  }

  carousel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      height: 400,
      child: ListView(
        children: <Widget>[
          pading(
              containerAd(
                  image(
                      'https://aceleracaodigital.com/wp-content/uploads/2016/05/sites-imagens-gratuitas-762x294.jpg'),
                  container(
                      pading(text('Lente Colorida', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://storage.googleapis.com/dpw/app/uploads/2009/12/como-otimizar-imagens-web-internet1.jpg'),
                  container(
                      pading(text('Tinta para pele', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://i1.wp.com/multarte.com.br/wp-content/uploads/2015/08/imagens-amor.jpg?fit=1680%2C1050&ssl=1'),
                  container(
                      pading(text('Livro Surpresa', 30.0, Colors.white), 0, 10,
                          0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://marquesfernandes.com/wp-content/uploads/2020/03/alexander-popov-iQqqo2zpmTI-unsplash-scaled.jpg'),
                  container(
                      pading(
                          text('Placas Neon', 30.0, Colors.white), 0, 10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://www.istockphoto.com/resources/images/PhotoFTLP/998044806.jpg'),
                  container(
                      pading(text('Palitos Coloridos', 30.0, Colors.white), 0,
                          10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image('https://imagens.mdig.com.br/thbs/45184mn.jpg'),
                  container(
                      pading(text('Camera para Selfie', 30.0, Colors.white), 0,
                          10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  containerAd(context, content) {
    return Container(
        height: 300,
        width: 300,
        color: Colors.black,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: context),
          content
        ]));
  }

  container(content, describe) {
    return Container(
      child: Column(
        children: <Widget>[content, describe],
      ),
    );
  }

  pading(content, double L, double T, double B, double R) {
    return Padding(padding: EdgeInsets.fromLTRB(L, T, R, B), child: content);
  }

  text(content, double size, color) {
    return Text(content, style: TextStyle(fontSize: size, color: color));
  }

  unavailable() {
    return text('Indisponivel', 30.0, Colors.red);
  }
}
