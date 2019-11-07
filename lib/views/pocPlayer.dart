import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/Player.dart';
import 'package:munchkin/services/data_base.dart';

class PocPlayer extends StatefulWidget {
  @override
  _PocPlayerState createState() => _PocPlayerState();
}

class _PocPlayerState extends State<PocPlayer> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:  _buildBody(),
      floatingActionButton: _buildFloatButton()
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Tela de tesde - Firebase :)'),
      );
  }

  Widget _buildBody(){
    return Center(
        child: Container(
          child: Center(
            child: _getAllPlayers(""),
        )
      )
    );
  }

  FloatingActionButton _buildFloatButton(){
    return FloatingActionButton(
        onPressed: () { DataBase.createPlayer(
          new Player( 
            forca: 1, 
            level: 1, 
            name: "Art3mis", 
            sexo: "F"
          )); 
        }, // Ao pressionar o botão vai criar a sala
        // O método createPlayer() se der sucesso retorna null, se der erro retorna uma msg!
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      );
  }

  // Exemplo de método para buscar salas
  StreamBuilder<QuerySnapshot> _getAllPlayers(String text){
    return StreamBuilder<QuerySnapshot>(
      stream: DataBase.getAllPlayers(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError){
          return new Text('Error: ${snapshot.error}');
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return new Text('Loading...');
        }
        else{
          return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {

                final player  = Player.fromMap(document.data);
                if (!player.name.toUpperCase().contains(text.toUpperCase())) // Caso o nome da sala não contenha o testo, retornar vazio (TEMPORÁRIO ATÉ APLICAR CONSULTA COM LIKE)
                  return Container();

                  //Exemplo de construção de card com nome e senha para cada sala
                 return Card(
                   child: ListTile(
                     title: new Text('Nome: ' + document['name']),
                     subtitle: new Text('Sexo: ' + document['sexo']),
                   ),
                 );
              }).toList(),
            );
        }
      },
    );
  }
}