import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/models/dados_mocados.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador de Munchkin'),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {
        return Navigator.pushNamed(context, '/pcPlayer');
      },),
      body: _buildScreen(),
    );
  }

  void _dialogFloat()
  {
    final _nameController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text('Como devemos te chamar ?'),
          content: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Digite seu nome'),
            controller: _nameController,
            autofocus: true,
            validator: (text)
            {
              return text.isEmpty ? "Insira o nome" : null;
            }
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: ()
              {
                Navigator.of(context).pop();
              }
            ),
            FlatButton(
              child: Text("Entrar"),
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }

    );
  }

  Widget _buildScreen(){
    return Column(children: <Widget>[
      Expanded(flex: 0, 
        child: Padding(
          padding: EdgeInsets.only(right: 25, left:25, top: 15, bottom: 30),
          child: TextField(
          decoration: InputDecoration(
            labelText: 'Buscar sala',
            suffixIcon: Icon(Icons.search)   
            ),
          ),
        )
      ),
      Expanded(flex: 0, child: _buildOfflineRoom(context)),
      Divider(),
      Row(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:25, top: 50, bottom: 15),
          child: Text('Salas online', style: Theme.of(context).textTheme.body1),
        )
      ]),
      Expanded(flex: 1, child: _buildBodyRoom(),),    
    ],);
  }

  Widget _buildBodyRoom()
  {
     if(roomList.isEmpty)
     {
       return Center(
         child: _loading ? CircularProgressIndicator() : Text('Sem salas'),
       );
     }
     else
     {
       return ListView.separated(
         separatorBuilder: (BuildContext context, int index) => Divider(),
         itemCount: roomList.length,
         itemBuilder: _buildRoomList
       );
     }
  }

  Widget _buildRoomList(BuildContext context, int index)
  {
      return  InkWell(
        onTap: (){}, 
        child: new Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 25, left:25, top: 30, bottom: 30),
            child: Icon(Icons.group),
          ),
          Text(roomList[index], style: Theme.of(context).textTheme.subtitle),
        ],
      ),);
  }

  Widget _buildOfflineRoom(context){
    return  InkWell(
      onTap: (){
        // print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||| ------> Score Page');
        // print(context);
        return Navigator.pushNamed(context, '/score');
      }, 
      child: Container(
        // color: Colors.teal[700],
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 25, left:25, top: 30, bottom: 30),
              child: Icon(Icons.signal_wifi_off),
            ),
            Text("Jogar off-line", style: Theme.of(context).textTheme.subtitle),
          ],
        )
      ),
    ); 
  }
}