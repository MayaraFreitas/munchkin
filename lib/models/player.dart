import 'dart:convert';

class Player{
  int forca;
  int level;
  String name;
  String sexo;
  String roomId = "A";

  Player({
    this.forca,
    this.level,
    this.name,
    this.sexo
  });

  Map<String, dynamic> toMap() =>{
    "forca": forca.toInt(),
    "level": level.toInt(),
    "name": name.toString(),
    "sexo": sexo.toString(),
  };

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  factory Player.fromMap(Map<String,dynamic> json) => Player(
    
    forca: json["forca"],
    level: json["level"],
    name: json["name"],
    sexo: json["sexo"]
  );
}