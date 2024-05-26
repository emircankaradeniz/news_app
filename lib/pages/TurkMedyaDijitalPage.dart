import 'package:flutter/material.dart';
import 'turkmedya.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TurkMedyaDijitalPage extends StatefulWidget {
  @override
  _TurkMedyaDijitalPageState createState() => _TurkMedyaDijitalPageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}
class _TurkMedyaDijitalPageState extends State<TurkMedyaDijitalPage> {
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/turk_medya_back.jpg'),
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
                        MaterialPageRoute(
                            builder: (context) => TurkMedyaPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/dijitalGray.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'TürkMedya Dijital',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Akşam, Güneş, Star, 24 TV, 360, tv4, Alem, Platin, Alem FM, Lig Radyo, Star Matbaacılık markalarını çatısı altında barındıran TürkMedya, dijital yayıncılık alanında da sektöre öncülük ederek 2016 yılının Ocak ayında TürkMedya Dijital’i kurdu.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Dijital bilgi toplumuna hızlı, doğru ve tarafsız içerik üreten, zamandan ve mekandan bağımsız her noktadan ulaşılabilen özgün yapısıyla TürkMedya Dijital, güçlü ve takibi yüksek markalarının web sitelerinin yanı sıra Twitter, Facebook, Instagram, YouTube gibi sosyal medya mecralarında ses getiren yeniliklere imza atmaya devam ediyor.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text(
                      'İletişim Bilgileri',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(thickness: 4.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Merkez Adresi',
                      details: 'Atatürk Mahallesi Bahariye Caddesi No:31 İkitelli- Küçükçekmece/İstanbul',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Merkez Telefon',
                      details: '0(212) 473 20 00',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Merkez Fax',
                      details: '0(212) 473 21 45',
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            // Footer
            Container(
              color: Colors.grey[700],
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Sosyal Medya',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Image.asset(
                            'lib/assets/facebook-white-icon.png',
                            width: 30,
                          ),
                          onPressed: () {
                            _launchURL('https://www.facebook.com/TurkMedyaTR/');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Image.asset(
                            'lib/assets/instagram-white-icon.png',
                            width: 30,
                          ),
                          onPressed: () {
                            _launchURL('https://www.instagram.com/turkmedyatr/');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Image.asset(
                            'lib/assets/x-white-icon.png',
                            width: 30,
                          ),
                          onPressed: () {
                            _launchURL('https://x.com/turkmedyatr/');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Image.asset(
                            'lib/assets/threads-white-icon.png',
                            width: 30,
                          ),
                          onPressed: () {
                            _launchURL('https://threads.com/turkmedyatr/');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      '@ Copyright 2024 Türkmedya',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
