import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/turkmedya');
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/turk_medya_back.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue.withOpacity(0.5), // Arka planı biraz saydam yapıyoruz
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/turk_medya_logo.png',
                          width: 100, // Logo boyutunu küçültüyoruz
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text('Türk Medya', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/globalnews');
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/global_haber_back.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue.withOpacity(0.5), // Arka planı biraz saydam yapıyoruz
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/global_haber_logo.jpg', // Yerel resim kullanımı
                          width: 100, // Boyutunu ayarlıyoruz
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text('Global News', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
