import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/turkmedya.dart';
import 'pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/globalnews': (context) => ChangeNotifierProvider(
          create: (context) => NewsNotifier(),
          child: NewsHomeScreen(),
        ),
      },
    );
  }
}
class NewsNotifier with ChangeNotifier {
}
