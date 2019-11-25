import 'dart:convert';

class Room{
  String name;
  bool active;

  Room({
    this.name,
    this.active
  });

  Map<String, dynamic> toMap() =>{
    "name": name,
    "active": active
  };

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  factory Room.fromMap(Map<String,dynamic> json) => Room(
    name: json["name"],
    active: json["active"]
  );
}