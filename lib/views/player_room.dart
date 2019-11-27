import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/Player.dart';
import 'package:munchkin/services/data_base.dart';

class PlayerRoom extends StatefulWidget {
  final String roomId;
  final Player player;

  const PlayerRoom({Key key, this.roomId, this.player}) : super(key: key);

  @override
  _PlayerRoomState createState() => _PlayerRoomState();
}

class _PlayerRoomState extends State<PlayerRoom> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomId),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.grey[50]),
            onPressed: () {
              DataBase.countPlayers(widget.roomId).then((countDB) {
                if (countDB == 1) {
                  DataBase.deletePlayer(widget.player);
                  DataBase.deleteRoom(widget.roomId);
                } else {
                  DataBase.deletePlayer(widget.player);
                  print('Não é o último jogador');
                  print(
                      'Número de jogadores na sala => ${DataBase.getPlayers(widget.roomId)}');
                }
                Navigator.pushNamed(context, '/home');
              });
            },
          )
        ],
      ),
      body: _buildPlayerList(),
    );
  }

  // Widget _buildBodyRoom()
  // {

  //    if(jogadores.isEmpty)
  //    {
  //      return Center(
  //        child: _loading ? CircularProgressIndicator() : Text('Sem salas'),
  //      );
  //    }
  //    else
  //    {
  //      return ListView.separated(
  //        separatorBuilder: (BuildContext context, int index) => Divider(),
  //        itemCount: jogadores.length,
  //        itemBuilder: _buildRoomList
  //      );
  //    }
  // }

  StreamBuilder<QuerySnapshot> _buildPlayerList() {
    return StreamBuilder<QuerySnapshot>(
      stream: DataBase.getPlayers(widget.roomId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return new Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return new Text('Loading...');
        } else {
          return new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              final player = Player.fromMap(document.data);

              //Exemplo de construção de card com nome e senha para cada sala
              //  return Card(
              //    child: ListTile(
              //      title: new Text('Nome: ' + document['name']),
              //      subtitle: new Text('Sexo: ' + document['sexo']),
              //    ),
              //  );

              return _buildRoomList(player);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildRoomList(Player player) {
    return InkWell(
      onTap: () {},
      child: new Row(
        children: <Widget>[
          leftSection,
          middleSection(player.name),
          _rightSection(player.level, player.forca)
        ],
      ),
    );
  }

  final leftSection = new Container(
    padding: new EdgeInsets.only(right: 25, left: 25, top: 30, bottom: 30),
    child: new CircleAvatar(
      backgroundColor: Colors.lightGreen,
      radius: 32.0,
    ),
  );
  middleSection(name) {
    return Container(
      child: new Column(
        children: <Widget>[
          //Text(jogadores[index], style: TextStyle(fontSize: 20, color: Colors.grey[400])),
          new Text(
            name,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  _rightSection(int level, int forca) {
    return new Expanded(
      child: new Container(
        padding: new EdgeInsets.only(left: 130.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              "Level:" + level.toString(),
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            new Text(
              "Força:" + forca.toString(),
              style: new TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
