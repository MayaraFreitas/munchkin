import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/dados_mocados.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/room.dart';
import 'package:munchkin/services/data_base.dart';

class SetupGame extends StatefulWidget {
  @override
  _SetupGameState createState() => _SetupGameState();
}

class _SetupGameState extends State<SetupGame> {
  bool _loading = true;
  String textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador de Munchkin'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: _buildCard('Jogar on-line', true, '/home')
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: _buildCard('Jogar off-line', false, '/score')
            )
          ],
        ),
      )
    );
  }

  Widget _buildCard(title, online, route) {
    return Center(
      child:
        Card(
        child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, route);
        },
          child: Padding(
          padding: EdgeInsets.all(50),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: !online ? Icon(Icons.signal_wifi_off) : Icon(Icons.network_wifi),
              ),
              
              Text(title, style: Theme.of(context).textTheme.subtitle)
            ],),
          )
        ),
      )
    );
  }
}