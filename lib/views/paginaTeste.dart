import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/Player.dart';

class PaginaTeste extends StatefulWidget {
  final String roomId;
  final Player player;

  const PaginaTeste({Key key, this.roomId, this.player}) : super(key: key);

  @override
  _PaginaTesteState createState() => _PaginaTesteState();
}

class _PaginaTesteState extends State<PaginaTeste> {
   bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.roomId),),
      body: Column(
        children: <Widget>[
          Text(widget.player.name),
          Text('level: ${widget.player.level}'),
          Text('level: ${widget.player.forca}'),
          Text('level: ${widget.player.sexo}'),
          Text(widget.roomId),
        ],
      ),
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

  // StreamBuilder<QuerySnapshot> _buildPlayerList(){
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: DataBase.getPlayers(widget.roomId),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError){
  //         return new Text('Error: ${snapshot.error}');
  //       }
  //       else if(snapshot.connectionState == ConnectionState.waiting){
  //         return new Text('Loading...');
  //       }
  //       else{
  //         return new ListView(
  //             children: snapshot.data.documents.map((DocumentSnapshot document) {

  //               final player  = Player.fromMap(document.data);

  //                 //Exemplo de construção de card com nome e senha para cada sala
  //               //  return Card(
  //               //    child: ListTile(
  //               //      title: new Text('Nome: ' + document['name']),
  //               //      subtitle: new Text('Sexo: ' + document['sexo']),
  //               //    ),
  //               //  );

  //               return _buildRoomList(player);
                
  //             }).toList(),
  //           );
  //       }
  //     },
  //   );
  // }
}