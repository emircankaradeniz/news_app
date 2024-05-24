import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/turkmedya.dart';
import 'pages/globalnews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/turkmedya': (context) => TurkMedyaPage(),
        '/globalnews': (context) => GlobalNewsPage(),
      },
    );
  }
}
