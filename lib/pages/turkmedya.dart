import 'package:flutter/material.dart';
import 'AksamPage.dart';
import 'DataRetrieval.dart';
import 'GunesPage.dart';
import 'DataStorage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TurkMedyaPage extends StatefulWidget {
  @override
  _TurkMedyaPageState createState() => _TurkMedyaPageState();
}
String? _currentPage = "Hakkımızda";
void _checkCurrentPage()async{
  final prefs =await SharedPreferences.getInstance();
  _currentPage = prefs.getString("_currentPage");
}
void _saveCurrentPage(String page)async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("_currentPage",page);
}

class _TurkMedyaPageState extends State<TurkMedyaPage> {
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState(){
    _checkCurrentPage();
    super.initState();
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
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _saveCurrentPage("Hakkımızda");
                                    _changePage('Hakkımızda', context);
                                  },
                                  child: Text('Hakkımızda'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _changePage('Markalar', context);
                                  },
                                  child: Text('Markalar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _changePage('Uygulamalar', context);
                                  },
                                  child: Text('Uygulamalar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _changePage(
                                        'İletişim ve Bilgi Toplumu Hizmetleri',
                                        context);
                                  },
                                  child: Text(
                                      'İletişim ve Bilgi Toplumu Hizmetleri'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            _buildBody(), // Expanded widget ile sayfanın kalan alanını kapla
            _buildFooter(), // Footer'ı sayfanın alt kısmına ekle
          ],
        ),
      ),
    );
  }
  Widget _buildBody() {
    switch (_currentPage) {
      case 'Hakkımızda':
        return HakkimizdaPage();
      case 'Markalar':
        return MarkalarPage();
      case 'Uygulamalar':
        return UygulamalarPage();
      case 'İletişim ve Bilgi Toplumu Hizmetleri':
        return IletisimPage();
      default:
        return Container();
    }
  }

  Widget _buildFooter() {
    return Container(
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
    );
  }

  void _changePage(String page, BuildContext context) {
    setState(() {
      _currentPage = page;
    });
    Navigator.pop(context);
  }
}
class HakkimizdaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'TürkMedya',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'TürkMedya; çok yönlü yayın anlayışıyla yeni Türkiye medyasında sürdürülebilir, yenilikçi ve güvenilir içerikleriyle yer alan bir yayın grubudur.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Bünyesinde Akşam, Güneş ve Star gazeteleri, Türkiye’nin haber kanallarından 24 TV, aile ve eğlence teması ile 360 ve tv4, uzun yıllardır okuyucusuyla buluşan Alem ve Platin dergileri ile Türkiye’nin özel radyolarından Alem FM ve spor yayıncılığı denilince akla gelen kanallardan olan Lig Radyo bulunmaktadır. Televizyon kanalları, radyolar, dergiler, basılı ve dijital yayın organları ile aktif olarak yayın hayatına devam etmektedir.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('lib/assets/turkmedyaresim.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarkalarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // İçeriği kaydırılabilir hale getirmek için
      child: Center(
        child: Column(
          children: [
            Image.asset('lib/assets/gazete.png'), // Resim dosyasının yolu
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/aksam.png'),
                  onPressed: () {
                    _checkCurrentPage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AksamPage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/gunes.png'), // Buton2 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GunesPage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/star.png'), // Buton3 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/tv.png'),
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/tv24.png'), // Buton1 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/360tv.png'), // Buton2 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/tv4.jpg'), // Buton3 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/radyo.png'),
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/alemFM.png'), // Buton1 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/Lig_Radyo.png'), // Buton2 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/24radyo.jpg'), // Buton3 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/dergi.png'),
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/alem.png'), // Buton1 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10), // Butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/platin.png'), // Buton2 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/baskı.png'),
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/starmatbacılık.png'), // Buton1 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('lib/assets/dijital.png'),
            SizedBox(height: 10), // Resim ile butonlar arasına boşluk ekler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Sağdan ve soldan padding ekler
              child: Container(
                height: 80, // Butonun yüksekliği
                width: double.infinity, // Butonun genişliği
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Çerçeve rengi
                    width: 1, // Çerçeve kalınlığı
                  ),
                  borderRadius: BorderRadius.circular(10), // Kenarları oval yapar
                ),
                child: IconButton(
                  icon: Image.asset('lib/assets/TürkmedyaDijital.png'), // Buton1 resmi
                  iconSize: 50, // İkon boyutu
                  onPressed: () {
                    // Butona tıklandığında yapılacaklar
                  },
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class UygulamalarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Uygulamalar'),
    );
  }
}

class IletisimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('İletişim ve Bilgi Toplumu Hizmetleri Sayfası'),
    );
  }
}
Future<void> main() async {
  runApp(MaterialApp(
    title: 'Turk Medya',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: TurkMedyaPage(),
  ));
}
