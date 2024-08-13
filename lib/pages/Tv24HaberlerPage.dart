import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:news_app/pages/Tv24Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/Tv24HaberData.dart';
import '../data/Tv24HaberData2.dart';

class Tv24HaberlerPage extends StatefulWidget {
  @override
  _Tv24HaberlerPageState createState() => _Tv24HaberlerPageState();
}

void _saveCurrentPage() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("_currentPage", "Markalar");
}
class _Tv24HaberlerPageState extends State<Tv24HaberlerPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var urlSndk = Uri.parse("https://www.yirmidort.tv/son-dakika");
  var urlGndm = Uri.parse("https://www.yirmidort.tv/gundem");
  List<Haber> haberler = [];
  List<Haber2> haberler2 = [];
  List<Haber> haberler3 = [];
  var data;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    getData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  void _changeData(int index) {
    setState(() {
      // Here you can define how the data changes. This is just an example.
      haberler2[index] = Haber2(
        image: 'https://via.placeholder.com/350/0000FF',
        baslik: 'Updated Title',
      );
    });
  }
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getData() async {
    var resSndk = await http.get(urlSndk);
    var resGndm = await http.get(urlGndm);
    final bodySndk = resSndk.body;
    final documentSndk = parser.parse(bodySndk);
    final bodyGndm = resGndm.body;
    final documentGndm = parser.parse(bodyGndm);

    var responseSndk = documentSndk
        .getElementsByClassName("news-detail")[0]
        .getElementsByClassName("hotnews-row")
        .forEach((element) {
        setState(() {
          haberler.add(
            Haber(
                image: element.children[0].children[0].children[0].children[0].children[0].children[1].children[0].attributes['data-src'].toString(),
                baslik: element.children[0].children[0].children[0].children[0].children[1].children[0].text.toString(),
                metin: element.children[0].children[0].children[0].children[0].children[1].children[1].text.toString(),
                saat: element.children[0].children[0].children[0].children[0].children[0].children[0].children[1].text.toString()
            ),
          );
        });
    });
    var responseGndm = documentGndm
        .getElementsByClassName("news-detail")[0]
        .getElementsByClassName("swiper-slide news-block")
        .forEach((element) {
      setState(() {
        haberler2.add(
          Haber2(
              image: element.children[0].children[0].children[0].attributes["data-src"].toString(),
              baslik: element.children[0].children[0].children[0].attributes["alt"].toString()
          ),
        );
      });
    });
    var responseGndm2 = documentGndm
        .getElementsByClassName("row")[0]
        .getElementsByClassName("category-news-card d-flex flex-row")
        .forEach((element) {
      setState(() {
        haberler3.add(
          Haber(
              image: element.children[0].children[0].children[0].attributes["data-src"].toString(),
              baslik: element.children[1].children[0].children[1].text.toString(),
              metin: element.children[1].children[0].children[2].text.toString(),
              saat: element.children[1].children[0].children[0].children[1].text.toString()
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/tv24Header.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _saveCurrentPage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tv24Page()),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            color: Colors.yellow,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(text: 'SON DAKİKA'),
                Tab(text: 'GÜNDEM'),
                Tab(text: 'EKONOMİ'),
                Tab(text: 'YAŞAM'),
                Tab(text: 'SPOR'),
                Tab(text: 'DÜNYA'),
                Tab(text: 'YAZARLAR'),
                Tab(text: 'PARAF KOBİ'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                  ),
                  itemCount: haberler.length,
                  itemBuilder: (context, index) =>Card(
                    elevation: 6,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time_sharp),
                            SizedBox(width: 5,),
                            Text(haberler[index].saat),
                            SizedBox(width: 10,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                haberler[index].image,
                                width: 320,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(haberler[index].baslik,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(haberler[index].metin),
                      ],
                    ),
                  ),
                ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Swiper(
                          itemCount: haberler2.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 6,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.network(
                                              haberler2[index].image,
                                              width: 340,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _changeData(index);
                                            },
                                            child: Container(
                                              width: 50,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 40,
                                        right: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                          child: Text(
                                            haberler2[index].baslik,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          pagination: SwiperPagination(),
                          control: SwiperControl(),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true, // Bu satır, GridView'ın genişlemesini engeller ve ListView ile birlikte çalışmasını sağlar.
                        physics: NeverScrollableScrollPhysics(), // GridView'ın kendi başına kaydırılmasını engeller.
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10
                        ),
                        itemCount: haberler3.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 6,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      haberler3[index].image,
                                      width: 270,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range_rounded),
                                      Text(haberler3[index].saat),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(haberler3[index].baslik,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(haberler3[index].metin),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(child: Text('EKONOMİ')),
                Center(child: Text('YAŞAM')),
                Center(child: Text('SPOR')),
                Center(child: Text('DÜNYA')),
                Center(child: Text('YAZARLAR')),
                Center(child: Text('PARAF KOBİ')),
              ],
            ),
          ),
        ],
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
