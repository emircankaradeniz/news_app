import 'package:flutter/material.dart';

class TurkMedyaPage extends StatefulWidget {
  @override
  _TurkMedyaPageState createState() => _TurkMedyaPageState();
}

class _TurkMedyaPageState extends State<TurkMedyaPage> {
  String _currentPage = 'Hakkımızda'; // Başlangıçta görüntülenen sayfa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turk Medya'),
      ),
      body: Container(
        child: Column(
        children: [
          Stack(
            children:[
          Container(
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/turk_medya_back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
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
                              _changePage('İletişim ve Bilgi Toplumu Hizmetleri', context);
                            },
                            child: Text('İletişim ve Bilgi Toplumu Hizmetleri'),
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
          Container(
            child: _buildBody(),
          ),
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
        ],
      ),
    );
  }
}

class MarkalarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Markalar Sayfası'),
    );
  }
}

class UygulamalarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Uygulamalar Sayfası'),
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

void main() {
  runApp(MaterialApp(
    title: 'Turk Medya',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: TurkMedyaPage(),
  ));
}
