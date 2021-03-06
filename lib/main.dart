import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:munchkin/views/pocPlayer.dart';
import 'package:munchkin/views/pocRoom.dart';
import 'package:munchkin/views/home_page.dart';
import 'package:munchkin/views/score_page.dart';
import 'package:munchkin/views/setup_game.dart';
import 'package:munchkin/views/player_room.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Munchkin',
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.grey[900],
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[900],
        accentColor: Colors.greenAccent[400],
        splashColor: Colors.greenAccent[700],
        

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
          subtitle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white70),
          body2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.greenAccent[400]),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white60),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SetupGame(),
        '/home': (context) => HomePage(),
        '/score': (context) => ScorePage(),
        '/pcRoom': (context) => PocRoom(),
        '/pcPlayer': (context) => PocPlayer(),
        '/playerRoom': (context) => PlayerRoom(),
      },
    );
  }

}


