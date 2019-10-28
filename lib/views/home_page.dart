import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _roomList = ['elfo', 'goblin', 'human'];
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador de Munchkin'),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),
      body: _buildBodyRoom(),
    );
  }

  Widget _buildBodyRoom()
  {
     if(_roomList.isEmpty)
     {
       return Center(
         child: _loading ? CircularProgressIndicator() : Text('Sem salas'),
       );
     }
     else
     {
       return ListView.separated(
         separatorBuilder: (BuildContext context, int index) => Divider(),
         itemBuilder: (context, index) => Padding(
        padding:EdgeInsets.only(top: 30.0, bottom: 30.0, left: 25.0, right: 25.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildRoomList()
        ],
        ),
      ),
       );
     }
  }

  Widget _buildRoomItem (int value, String label, String nomeCampo)
  {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(value.toString(), style: TextStyle(fontSize: 36)),
        ),
        Text(label, style: TextStyle(fontSize: 20, color: Colors.grey[400])),
      ],
    );
  }

  Widget _buildRoomList()
  {
    return Column(
      children: <Widget>[
        _buildRoomItem(2, 'teste', 'tes'),
        Divider(),
        _buildRoomItem(3, 'teste1', 'tes1'),
      ],
    );
  }
}