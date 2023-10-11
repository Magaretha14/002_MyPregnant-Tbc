import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_detail.dart';

class SaranTidur extends StatelessWidget {
  const SaranTidur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Saran posisi tidur'),

      /// Custom app bar.
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
                          image: AssetImage('images/sarantidurbumil.png'),

                          /// Image asset.
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
                  'Saran Posisi Tidur Selama Kehamilan : ',

                  /// Title text.
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Tidur pada sisi kiri \n Tidur pada sisi kiri dianggap sebagai posisi terbaik selama kehamilan. Ini membantu meningkatkan aliran darah dan nutrisi ke plasenta, memfasilitasi sirkulasi yang sehat bagi bayi, dan mencegah tekanan pada vena cava inferior (pembuluh darah besar di sebelah kanan rahim).',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. Gunakan bantal tubuh \n Menggunakan bantal tubuh atau bantal khusus kehamilan dapat memberikan dukungan tambahan dan membantu menjaga posisi yang nyaman saat tidur. Anda dapat meletakkan bantal di antara lutut, di bawah perut, dan di belakang punggung untuk mengurangi tekanan pada tubuh.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Jaga kenyamanan \n Pastikan tempat tidur Anda nyaman dengan menggunakan kasur yang sesuai, bantal yang tepat, dan lingkungan tidur yang tenang dan gelap. Anda juga dapat mencoba teknik pernapasan, meditasi, atau mendengarkan musik yang menenangkan sebelum tidur untuk membantu Anda rileks.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
