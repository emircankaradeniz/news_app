import 'package:flutter/material.dart';
import 'turkmedya.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AlemPage extends StatefulWidget {
  @override
  _AlemPageState createState() => _AlemPageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}

class _AlemPageState extends State<AlemPage> {
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
                  image: AssetImage('lib/assets/dergiGray.png'),
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
                      image: AssetImage('lib/assets/alemSite.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 16,
                  width: 120,
                  child: IconButton(
                    icon: Image.asset('lib/assets/wwwalem.png'),
                    onPressed: () {
                      _launchURL('https://www.alem.com.tr/');
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
                    'Alem Dergisi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Türkiye’nin Bir Numaralı Yaşam ve Cemiyet Dergisi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ALEM, 16 Haziran 1993 yılından bu yana Türkiye’nin 1 numaralı yaşam ve cemiyet dergisi olarak her Çarşamba okuyucularıyla buluşmaya devam ediyor.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Haftalık dergi pazarının en köklü markası olan ALEM deneyimli kadrosuyla çağdaş sanat, moda, seyahat ve kültür üzerine yazı, röportaj ve içeriğiyle her hafta takipçilerine ulaşıyor. Gerçekleştirdiği sanat etkinlikleriyle de alanında bir ilke imza atan Alem Dergisi, Türkiye’de ilk kez ‘Art Weekend’ konseptini hayata geçirdi. Dijital yayınlarıyla yeni nesil medyanın da önemli temsilcilerinden ve önderlerinden biri haline gelen Alem, gerçekleştirdiği prodüksiyonlu kapak çekimleri, röportajlarla da moda dünyasının en dikkat çeken mecralarından biri konumunda. Özel röportajlarıyla ve gerçekleştirdiği çekimler ile kültür-sanattan modaya, seyahatten gustoya, görkemli açılış ve davetlerle cemiyet hayatının tanınmış simalarının renkli hayatlarını sunan ALEM Dergisi, sizlere bugün ve gelecek arasında lüks yaşam yolculuğu yaptırırken aynı zamanda hedef kitlesinin özel ilgi alanlarına referans niteliğinde köklü saygın ve güvenilir bir “yaşam rehberi” sunmaktadır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ALEM Dergisi, dijital dünyada da ALEM Talks canlı yayın ve podcast programları ile sektörün önde gelen isimlerini ağırlıyor. Yaklaşık yarım milyonluk Instagram hesabı, Youtube kanalı, Spotify ile Tiktok hesapları ve günlük haber akışı sunan alem.com.tr web sayfasıyla güncel olanı yakalamayı başarıyor.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Yıllardır süregelen farklı konseptlerle özel davetlerinin yanı sıra destek verdiği sayısız sosyal sorumluluk projeleriyle de tüm dünyada değişen tüketici algısına istinaden ALEM Dergisi okurlarına ürün değil deneyim sunmaktadır.',
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
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Basıldığı Yer',
                      details: 'Turkuvaz Haberleşme Ve Yayıncılık A.Ş.',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Genel Dağıtım',
                      details: 'Turkuvaz Dağıtım Pazarlama A.Ş.',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'İstanbul Matbaa',
                      details: 'Güzeltepe Mah. Mareşal Fevzi Çakmak Cad. B Blok 29/1/1 Eyüpsultan / İstanbul',
                      phone: '(0212) 354 30 00',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Ankara Matbaa',
                      details: 'Esenboğa Yolu 13 km, Pursaklar / ANKARA',
                      phone: '(0312) 328 85 00',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'İzmir Matbaa',
                      details: 'Çınarlı Mahallesi Ankara Asfaltı Caddesi no:5 Konak / İzmir',
                      phone: '(0232) 497 15 00',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Adana Matbaa',
                      details: 'Ceyhan Yolu Üzeri 5 km, Sabah Tesisleri Yüreğir / Adana',
                      phone: '(0322) 346 30 93',
                    ),
                    Divider(thickness: 1.0,color: Colors.black,),
                    ContactInfo(
                      title: 'Trabzon Matbaa',
                      details: 'Arsin Organize Sanayi Bölgesi 1.Cadde No:14',
                      phone: '(0462) 711 16 05',
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
