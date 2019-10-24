import 'dart:convert';

class Room{
  String name;
  String password;

  Room({
    this.name,
    this.password
  });

  Map<String, dynamic> toMap() =>{
    "name": name,
    "password": password
  };

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  factory Room.fromMap(Map<String,dynamic> json) => Room(
    name: json["name"],
    password: json["password"]
  );
}