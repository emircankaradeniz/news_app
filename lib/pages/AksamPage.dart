import 'package:flutter/material.dart';
import 'turkmedya.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AksamPage extends StatefulWidget {
  @override
  _AksamPageState createState() => _AksamPageState();
}
void _saveCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage","Markalar" );
}

class _AksamPageState extends State<AksamPage> {
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
                  image: AssetImage('lib/assets/gazeteGray.png'),
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
                      image: AssetImage('lib/assets/aksamSite.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 16,
                  width: 120,
                  child: IconButton(
                    icon: Image.asset('lib/assets/wwwaksam.png'),
                    onPressed: () {
                      _launchURL('https://www.aksam.com.tr/');
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
                      _launchURL('https://play.google.com/store/apps/details?id=com.aksam.android');
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
                      _launchURL('https://apps.apple.com/us/app/ak%C5%9Fam/id982894881?ls=1');
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
                    'Akşam Gazetesi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Türkiye\'nin Gazetesi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '20 Eylül 1918\'de Necmettin Sadak, Kazım Şinasi Dersan, Falih Rıfkı Atay ve Ali Naci Karacan tarafından kurulan AKŞAM, köklü tarihiyle Türk basınının kilometre taşlarından biri olmuş; kurulduğu ilk günden bu yana güvenilir haberciliğin simgesi haline gelmiştir.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Osmanlı’nın son dönemlerinden başlayarak modern Türkiye\'nin tarihine tanıklık eden AKŞAM Gazetesi, Türkiye tarihinin kritik dönüm noktalarında aldığı tavırla ön plana çıkmış, tercihini daima “haklı olan” dan yana kullanmıştır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'İlk sayısında baş makalesi "Yeni Devir" olan AKŞAM, o dönemde İstanbul\'da Kuva-yi Milliye hareketini destekleyen az sayıdaki gazetelerden biri olarak; Türkiye’nin bağımsızlık savaşı verdiği günlerde, Anadolu’dan gelen haberleri yayınlayan cesur gazeteler arasında yerini almıştır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'AKŞAM\'ın faaliyetlerinin temelini, halkın gerçek gündemini yansıtan özel haberler, güçlü yazarlar, ilgi uyandıran yazı dizileri, bulmaca, at yarışı ve hafta sonlarının vazgeçilmezi haline gelen ek yayınları Fikir ve tartışma eki Açık Görüş ve zengin, dopdolu içeriğiyle Akşam Cumartesi eki oluşturmaktadır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'akşam.com.tr; her gün gelişen iletişim teknolojisi ve dijital altyapısı ile birlikte web sitesinden anlık olarak gündemi, yaşamın her alanından etkin içerikleri, birbirinden değerli isimlerin köşe yazılarını aktarmaktadır. Bunun yanı sıra Akşam, Akşam TV ile spordan sanata, modadan teknolojiye, at yarışından bulmacaya, sağlıktan magazine kadar gündemin nabzını tutan birçok içeriği takipçilerine sunmaktadır.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Basın ve fikir hayatında önemli isimlere ev sahipliği yapan AKŞAM, TürkMedya çatısı altında yeniliklerle dolu yolculuğuna devam etmektedir.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
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
