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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {print('teste1');},),
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
         itemCount: _roomList.length,
         separatorBuilder: (BuildContext context, int index) => Divider(),
         itemBuilder: (context, index) => Padding(
          padding:EdgeInsets.only(top: 30.0, bottom: 30.0, left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            _buildRoomList()
            ],
          ),
        ),
       );
     }
  }

  Widget _buildRoomList()
  {
      List<Widget> list = new List<Widget>();
      for (var i = 0; i < _roomList.length; i++) 
      {
        list.add(new Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text('1', style: TextStyle(fontSize: 36)),
        ));
        list.add(new Text(_roomList[i], style: TextStyle(fontSize: 20, color: Colors.grey[400])));  
        list.add(Divider());        
      }
      return new Row(children: list);
  }
}