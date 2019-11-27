import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:munchkin/models/Player.dart';
import 'package:munchkin/models/room.dart';

class DataBase {
  static Future<bool> _checkRoomExist(String roomId) async {
    try {
      bool exist = false;
      await Firestore.instance.document('rooms/$roomId').get().then((document) {
        exist = document.exists;
      });
      return exist;
    } catch (ex) {
      return false;
    }
  }

  static Future<String> createRoom(Room room) async {
    // Verificando se já existe uma sala com o mesmo nome (id)
    _checkRoomExist(room.name).then((value) {
      if (!value) {
        Firestore.instance.document("rooms/${room.name}").setData(room.toMap());
        return null;
      } else {
        return "Ops! Já existe uma sala chamada ${room.name}";
      }
    });
  }

  static Future<String> updateRoom(Room room) async {
    // Verificando se já existe uma sala com o mesmo nome (id)
    _checkRoomExist(room.name).then((value) {
      if (value) {
        Firestore.instance.document("rooms/${room.name}").setData(room.toMap());
        return null;
      } else {
        return "Ops! Já existe uma sala chamada ${room.name}";
      }
    });
  }

  static Future<String> deleteRoom(String roomId) async {
    // Verificando se já existe uma sala com o mesmo nome (id)
    _checkRoomExist(roomId).then((value) {
      if (value) {
        Firestore.instance.document("rooms/${roomId}").delete();
        return null;
      } else {
        return "Ops! Já não existe uma sala chamada ${roomId}";
      }
    });
  }

  static Stream<QuerySnapshot> getAllRooms() {
    return Firestore.instance.collection('rooms').snapshots();
  }

  static Future<int> countPlayers(String roomId) async {
    var respectsQuery = Firestore.instance.collection("rooms/$roomId/players");
    var querySnapshot = await respectsQuery.getDocuments();
    var totalEquals = querySnapshot.documents.length;
    return totalEquals;
  }

  static Future<bool> _checkPlayerExist(Player player) async {
    try {
      bool exist = false;
      await Firestore.instance
          .document('rooms/${player.roomId}/players/${player.name}/')
          .get()
          .then((document) {
        exist = document.exists;
      });
      return exist;
    } catch (ex) {
      return false;
    }
  }

  static Future<String> createPlayer(Player player) async {
    _checkPlayerExist(player).then((value) {
      if (!value) {
        var documentReference = Firestore.instance
            .document("rooms/${player.roomId}/players/${player.name}")
            .setData(player.toMap());
        return null;
      } else {
        return "Ops! Já existe um player chamado ${player.name}";
      }
    });
  }

  static Future<String> updatePlayer(Player player) async {
    _checkPlayerExist(player).then((value) {
      if (value) {
        var documentReference = Firestore.instance
            .document("rooms/${player.roomId}/players/${player.name}")
            .setData(player.toMap());
        return null;
      } else {
        return "Ops! Não existe um player chamado ${player.name}";
      }
    });
  }

  static Future<String> deletePlayer(Player player) async {
    _checkPlayerExist(player).then((value) {
      if (value) {
        var documentReference = Firestore.instance
            .document("rooms/${player.roomId}/players/${player.name}")
            .delete();
        return null;
      } else {
        return "Ops! Não existe um player chamado ${player.name}";
      }
    });
  }

  static Stream<QuerySnapshot> getPlayers(String roomId) {
    return Firestore.instance
        .document("rooms/${roomId}")
        .collection('players')
        .snapshots();
  }
}
