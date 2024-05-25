import 'package:flutter/material.dart';
import 'package:news_app/pages/DataRetrieval.dart';
import 'package:news_app/pages/DataStorage.dart';
import 'pages/home.dart';
import 'pages/turkmedya.dart';
import 'pages/globalnews.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataStorage.initialize();
  await DataRetrieval.initialize();
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
