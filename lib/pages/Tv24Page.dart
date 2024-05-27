import 'package:flutter/material.dart';
import 'turkmedya.dart';
import 'package:news_app/pages/Tv24HaberlerPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Tv24Page extends StatefulWidget {
  @override
  _Tv24PageState createState() => _Tv24PageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}
class _Tv24PageState extends State<Tv24Page> {
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
                  image: AssetImage('lib/assets/tvGray.png'),
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
                      image: AssetImage('lib/assets/tv24Site.jpg'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 16,
                  width: 120,
                  child: IconButton(
                    icon: Image.asset('lib/assets/wwwtv24.png'),
                    onPressed: () {
                      _launchURL('https://www.yirmidort.tv/');
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
                      _launchURL('https://play.google.com/store/apps/details?id=tv.yirmidort.android');
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
                      _launchURL('https://itunes.apple.com/us/app/24-tv/id1187926970?ls=1&mt=8');
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: double.infinity,
                child: IconButton(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    child: Image.asset('lib/assets/haberleregit.png'),
                  ),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tv24HaberlerPage()),
                    );
                  },
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
                    '24 TV',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Doğrusunu Öğrenin',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hızlı, tarafsız, doğru haber anlayışı ve yetenekli kadrosu ile gündem oluşturan, milletin sesine kulak veren haber programları ve yaşam programlarının yer aldığı 24 TV, 2007 yılında yayın hayatına başlamıştır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '10 Nisan 2018 tarihinde HD yayına geçiş yapan 24 TV, bölgesel ve küresel olayların analiz edildiği haber tartışma programları, haber izleyicisine en özel, en sıcak haberleri ve canlı bağlantılarla gündemin yoğun haber akışını anlık olarak vermektedir.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '24 TV haber merkezinin izleyiciye vaadi; toplumun tansiyonunu anlamaya ve doğru aktarmaya çalışan; adil, önyargısız farklı bakış açıları geliştirebilen ve refleksi kuvvetli bir ekiple her an sıcak ve doğru habere ulaşabileceklerini bilmeleridir.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Türkiye ve dünyada yer alan gelişmelerin, yoğun gündem ve haber akışının yanı sıra, yemek, psikoloji, gençlere ve aileye yönelik; belgesel, gezi, doğa, tarih, otomobil ve spor kategorilerinde de yayın yapan geniş yelpazesi ile farklı yaşam programları da izleyici ihtiyacı ve faydasına hizmet etmek için yayın akışında yer almaktadır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '24 TV, Türkiye’de en çok dijital ekranı barındırmakta, 360 derece açılı stüdyosu ile teknoloji ve medyadaki inovasyon ve gelişmeleri yakından takip etmekte ve izleyicinin ihtiyaçlarına cevap vermektedir.',
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
