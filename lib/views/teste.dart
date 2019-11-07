import 'package:flutter/material.dart';
import 'package:munchkin/models/dados_mocados.dart';
import 'package:munchkin/models/lancar_dado.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Jogador jogador = new Jogador("Jogador 1", "M", 1, 0, 3);

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Munchkinho"),
          ] 
        ),
      ),
      body: SingleChildScrollView(child:  HomePage(),), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}