import 'package:flutter/material.dart';
import 'turkmedya.dart';

class AksamPage extends StatefulWidget {
  @override
  _AksamPageState createState() => _AksamPageState();
}

class _AksamPageState extends State<AksamPage> {
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
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 16,
                  width: 80,
                  child: IconButton(
                    icon: Image.asset('lib/assets/GetPlay.png'),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 16,
                  width: 80,
                  child: IconButton(
                    icon: Image.asset('lib/assets/DowAppStore.png'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      // Facebook URL or functionality
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
                      // Instagram URL or functionality
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
                      // X URL or functionality
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
                      // Threads URL or functionality
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
