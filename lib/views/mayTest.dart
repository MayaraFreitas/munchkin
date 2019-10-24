import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/room.dart';

class MayTest extends StatefulWidget {
  @override
  _MayTestState createState() => _MayTestState();
}

class _MayTestState extends State<MayTest> {

  
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
            child: _getAllRooms(),
        )
      )
    );
  }

  FloatingActionButton _buildFloatButton(){
    return FloatingActionButton(
        onPressed: () { _createRoom(new Room( name: "Nomezin :)", password: "senha")); },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      );
  }

  StreamBuilder<QuerySnapshot> _getAllRooms(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('rooms').snapshots(),
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

  static Future<bool> checkRoomExist(String roomId) async{
    try{
      bool exist = false;
      await Firestore.instance.document('rooms/$roomId').get().then((document){
        exist = document.exists;
      });
      return exist;
    }catch(ex){
      return false;
    }
  }
  
  static Future<void> _createRoom(Room room) async{
    checkRoomExist(room.name).then((value){
      if(!value){
        Firestore.instance.document("rooms/${room.name}").setData(room.toMap());
      }
    });
  }
  
}