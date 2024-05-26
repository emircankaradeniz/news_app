import 'package:flutter/material.dart';
import 'turkmedya.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Radyo24Page extends StatefulWidget {
  @override
  _Radyo24PageState createState() => _Radyo24PageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}
class _Radyo24PageState extends State<Radyo24Page> {
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
                  image: AssetImage('lib/assets/radyoGray.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/24radyoSite.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 16,
                  width: 120,
                  child: IconButton(
                    icon: Image.asset('lib/assets/www24radyo.png'),
                    onPressed: () {
                      _launchURL('https://www.24radyo.com/');
                    },
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 16,
                  width: 80,
                  child: IconButton(
                    icon: Image.asset('lib/assets/GetPlay.png'),
                    onPressed: () {
                      _launchURL('https://play.google.com/store/apps/details?id=com.radyo.yirmidort.android&hl=tr&gl=US');
                    },
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 16,
                  width: 80,
                  child: IconButton(
                    icon: Image.asset('lib/assets/DowAppStore.png'),
                    onPressed: () {
                      _launchURL('https://apps.apple.com/tr/app/24-radyo/id6476484735?l=tr');
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    '24 Radyo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Haberin Yeni Frekansında Yenilikçi Dönem',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '24 Radyo, "Haberin Yeni Frekansı" mottosuyla 30 Aralık 2023 tarihinde yayın hayatına başladı.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '24 TV’nin sektördeki uzun yıllara dayanan tecrübesini ve geleneksel haber anlayışını modern tekniklerle harmanlayarak, dinleyicilerine farklı bir deneyim sunan 24 Radyo, 24 saat hızlı, tarafsız ve güncel haber sunmaktadır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Geniş frekans ağı ve internet üzerinden günün her saati en yeni gelişmeleri dinleyicilerine aktaran ve anında bilgi kaynağına erişimini sağlayan 24 Radyo, haber dinleme deneyiminizi baştan oluşturuyor.',
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
