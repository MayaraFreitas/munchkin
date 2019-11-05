import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/room.dart';
import 'package:munchkin/services/data_base.dart';

class PocRoom extends StatefulWidget {
  @override
  _PocRoomState createState() => _PocRoomState();
}

class _PocRoomState extends State<PocRoom> {

  
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
            child: _getAllRooms(":)"),
        )
      )
    );
  }

  FloatingActionButton _buildFloatButton(){
    return FloatingActionButton(
        onPressed: () { DataBase.createRoom(new Room( name: "Mutiquinho3S", password: "senha")); }, // Ao pressionar o botão vai criar a sala
        // O método createRoom() se der sucesso retorna null, se der erro retorna uma msg!
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      );
  }

  // Exemplo de método para buscar salas
  StreamBuilder<QuerySnapshot> _getAllRooms(String text){
    return StreamBuilder<QuerySnapshot>(
      stream: DataBase.getAllRooms(),
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

                final room = Room.fromMap(document.data);
                if (!room.name.toUpperCase().contains(text.toUpperCase())) // Caso o nome da sala não contenha o testo, retornar vazio (TEMPORÁRIO ATÉ APLICAR CONSULTA COM LIKE)
                  return Container();

                  //Exemplo de construção de card com nome e senha para cada sala
                 return Card(
                   child: ListTile(
                     title: new Text('Nome: ' + document['name']),
                     subtitle: new Text('Senha: ' + document['password']),
                   ),
                 );
              }).toList(),
            );
        }
      },
    );
  }
}