import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Tv24HaberlerPage extends StatefulWidget {
  @override
  _Tv24HaberlerPageState createState() => _Tv24HaberlerPageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}
class _Tv24HaberlerPageState extends State<Tv24HaberlerPage> {
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  var url =Uri.parse("https://www.yirmidort.tv/son-dakika");
  var data;
  Future getData() async {
    var res =await http.get(url);
    final body=res.body;
    final document =parser.parse(body);
    var response =document
        .getElementsByClassName("news-detail")[0]
        .getElementsByClassName("hotnews-row")
        .forEach((element) {
          print(element.children[0]
              .children[0]
              .children[0]
              .children[0]
              .children[0]
              .children[1]
              .className.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("appbar"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: Text(data.toString())),
              ElevatedButton(
                child: Text("Dataları getir"),
                onPressed: () => getData() ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ContactInfo extends StatelessWidget {
  final String title;
  final String details;
  final String? phone;

  ContactInfo({
    required this.title,
    required this.details,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(details),
          if (phone != null) Text('Telefon: $phone'),
        ],
      ),
    );
  }
}
