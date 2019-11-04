import 'package:munchkin/views/home_page.dart';
import 'package:munchkin/views/score_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Munchkin',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[900],
        accentColor: Colors.greenAccent[400],
        

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white70),
          subtitle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white54),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white54),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/score': (context) => ScorePage()
      },
    );
  }

}


