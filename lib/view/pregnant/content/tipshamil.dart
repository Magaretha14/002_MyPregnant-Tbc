import 'package:flutter/material.dart';

class TipsHamil extends StatelessWidget {
  const TipsHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: PageView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.pink,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/tipskehamilan.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Saran Selama Kehamilan : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Periksakan diri secara teratur \n Penting untuk menjalani pemeriksaan kehamilan secara teratur dengan dokter kandungan atau bidan. Pemeriksaan ini akan memantau perkembangan kesehatan Anda dan bayi dalam kandungan.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. Pola makan sehat \n Pastikan Anda mendapatkan nutrisi yang seimbang dengan mengonsumsi makanan yang kaya akan protein, serat, vitamin, dan mineral. Penting untuk menghindari makanan mentah atau yang berisiko menyebabkan infeksi.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Minum air yang cukup \n Pastikan Anda terhidrasi dengan baik selama kehamilan. Minumlah air yang cukup setiap hari untuk menjaga kesehatan tubuh dan membantu perkembangan janin.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '4. Hindari obat-obatan yang tidak aman \n Diskusikan dengan dokter kandungan atau apoteker mengenai obat-obatan atau suplemen apa pun yang aman untuk dikonsumsi selama kehamilan. Hindari obat-obatan yang tidak diresepkan atau tanpa rekomendasi medis.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '5. Olahraga ringan \n Tanyakan kepada dokter kandungan Anda mengenai jenis olahraga yang aman untuk Anda lakukan selama kehamilan. Biasanya, olahraga ringan seperti jalan kaki, berenang, atau prenatal yoga disarankan untuk menjaga kesehatan dan kebugaran selama kehamilan.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '6. Istirahat yang cukup \n Perhatikan kebutuhan tubuh Anda akan istirahat dan tidur yang cukup. Usahakan untuk tidur dalam posisi yang nyaman dan gunakan bantal yang mendukung tubuh Anda.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
