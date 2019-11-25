import 'package:flutter/material.dart';
import 'package:munchkin/models/dados_mocados.dart';
import 'package:munchkin/models/lancar_dado.dart';
import 'package:munchkin/models/player.dart';
import 'package:munchkin/services/data_base.dart';


class ScorePlayerOnline extends StatefulWidget {

  final String roomId;
  final String playerName;

  const ScorePlayerOnline({Key key, this.roomId, this.playerName}) : super(key: key);

  @override
  _ScorePlayerOnlineState createState() => _ScorePlayerOnlineState();
}


class _ScorePlayerOnlineState extends State<ScorePlayerOnline> {

  final player  = Player();

  _somaValores(level, forca) {
    return level + forca;
  }

  void _lancarDado({String title, String message, Function confirm}){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Color(0xff352440),
          title: Text(title ?? ""),
          content: Text(message ?? ""),
          actions: <Widget>[
            FlatButton(
              child: Text("OK", style: TextStyle(color: Colors.greenAccent[400])),
              onPressed: (){
                Navigator.of(context).pop();
                if(confirm != null) confirm();
              },
            ),
          ],
        );
      }
    );
  }

 void _showDialog(
  {String title, String message, Function confirm, Function cancel}){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Color(0xff352440),
          title: Text(title ?? ""),
          content: Text(message ?? ""),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCELAR", style: TextStyle(color: Colors.grey[400])),
              onPressed: (){
                Navigator.of(context).pop();
                if(cancel != null) cancel();
              },
            ),
            FlatButton(
              child: Text("CONFIRMAR", style: TextStyle(color: Colors.greenAccent[400])),
              onPressed: (){
                Navigator.of(context).pop();
                if(confirm != null) confirm();
              },
            ),
          ],
        );
      }
    );
  }

  Widget _scorePanel() {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(_somaValores(player.level, player.forca).toString(), style: TextStyle(fontSize: 90.0, letterSpacing: 12.0, color: Colors.grey[50])),
                Text("Força total", style: TextStyle(color: Colors.grey[50])),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: FlatButton(
                      onPressed: () {
                        /*DEVE IR PARA PÁGINA DA MESA*/
                      },
                      child: IconButton(
                      icon: Icon(player.sexo == "F" ? Icons.person : Icons.person_outline, color: Colors.grey[50]),
                      onPressed: () {
                        setState(() {
                          // player.setSexo(player); 
                        });
                      },
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: FlatButton(
                      onPressed: () {
                        /*DEVE IR PARA PÁGINA DA MESA*/
                      },
                      // child: Text(player.getPosicao(player) + "º POSIÇÃO",)
                  ),
                )
              ],    
            )
        ),
        color: Color(0xff2DBDB6),
        height: 300.0,
      ),
    );
  }




  Widget _ScorePlayerOnline(){
    return Column(
      children: <Widget>[
        _scorePanel(),
        _scoreActionList()
      ],
    );
  }

  Widget _scoreActionListItem(int value, String label, String nomeCampo){
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0, left: 25.0, right: 25.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(value.toString(), style: TextStyle(fontSize: 36.0))       
              ),
              Text(label, style: TextStyle(fontSize: 20.0, color: Colors.grey[400])),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if((player.level > 1) && (player.forca > 0)){
                        // nomeCampo == "level" ? player.level = player.removeLevel(player) : player.forca = player.removeForca(player);
                      }
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.greenAccent[400]),
                onPressed: () {
                  setState(() {
                    if(player.level < 10){
                      // nomeCampo == "level" ? player.level = player.addLevel(player) : player.forca = player.addForca(player);
                    }
                    if(player.level >= 10){
                      _showDialog(
                        title: 'Fim de jogo',
                        message: "Você atingiu o level 10",
                        confirm: () {
                          setState(() {
                          });
                        },
                        cancel: () {
                          setState(() {
                            // player.level = player.removeLevel(player);
                          });
                        }
                      );
                    }
                  });
                },
              )
            ],
          )
        ]
      )
    );
  }

  Widget _scoreActionList(){
    return Column(
      children: <Widget>[
        _scoreActionListItem(player.level, "Level", "level"),
        Divider(),
        _scoreActionListItem(player.forca, "Força", "forca")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Jogo off-line"),
          ] 
        ),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.casino , color: Colors.grey[50]),
          onPressed: () {
             _lancarDado(
              title: 'Dado lançado',
              message: 'Você tirou:  ' + getDadoValor()
            );
          },
        )
      ],
      ),
      body: SingleChildScrollView(child:  _ScorePlayerOnline(),), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}