import 'package:flutter/material.dart';
import 'package:munchkin/models/dados_mocados.dart';
import 'package:munchkin/models/lancar_dado.dart';


class ScorePage extends StatefulWidget {
  @override
  _ScorePageState createState() => _ScorePageState();
}

Jogador jogador = new Jogador("Jogador 1", "M", 1, 0, 3);

class _ScorePageState extends State<ScorePage> {

  void _lancarDado({String title, String message, Function confirm}){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
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
                Text(jogador.getScoreTotal(jogador).toString(), style: TextStyle(fontSize: 90.0, letterSpacing: 12.0)),
                Text("Força total"),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: FlatButton(
                      onPressed: () {
                        /*DEVE IR PARA PÁGINA DA MESA*/
                      },
                      child: IconButton(
                      icon: Icon(jogador.sexo == "F" ? Icons.person : Icons.person_outline, color: Colors.grey[50]),
                      onPressed: () {
                        setState(() {
                          jogador.setSexo(jogador); 
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
                      child: Text(jogador.getPosicao(jogador) + "º POSIÇÃO",)
                  ),
                )
              ],    
            )
        ),
        color: Colors.redAccent[400],
        height: 300.0,
      ),
    );
  }


  Widget _scorePage(){
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
                      if((jogador.level > 1) && (jogador.forca > 0)){
                        nomeCampo == "level" ? jogador.level = jogador.removeLevel(jogador) : jogador.forca = jogador.removeForca(jogador);
                      }
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.greenAccent[400]),
                onPressed: () {
                  setState(() {
                    if(jogador.level < 10){
                      nomeCampo == "level" ? jogador.level = jogador.addLevel(jogador) : jogador.forca = jogador.addForca(jogador);
                    }
                    if(jogador.level >= 10){
                      _showDialog(
                        title: 'Fim de jogo',
                        message: "Você atingiu o level 10",
                        confirm: () {
                          setState(() {
                          });
                        },
                        cancel: () {
                          setState(() {
                            jogador.level = jogador.removeLevel(jogador);
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
        _scoreActionListItem(jogador.level, "Level", "level"),
        Divider(),
        _scoreActionListItem(jogador.forca, "Força", "forca")
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
            Text("Munchkin",style: TextStyle(color: Colors.grey[50])),
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
      body: SingleChildScrollView(child:  _scorePage(),), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}