import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:munchkin/views/home_page.dart';
import 'package:munchkin/views/score_page.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.greenAccent[400],
        accentColor: Colors.grey[900],
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.grey[50]
          )
        )
      )));
    });
}
