import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_detail.dart';

class SaranMakanan extends StatelessWidget {
  const SaranMakanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Saran makanan ibu hamil'),

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
                          image: AssetImage('images/saranmakananibuhamil.png'),

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
                  'Saran Makanan Selama Kehamilan : ',

                  /// Title text.
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Protein \n Asupan protein yang cukup penting untuk pertumbuhan dan perkembangan sel-sel baru. Sumber protein yang baik meliputi daging tanpa lemak, ikan, telur, kacang-kacangan, tahu, tempe, dan produk susu rendah lemak atau tanpa lemak.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. Buah-buahan dan sayuran \n Konsumsilah berbagai jenis buah-buahan dan sayuran, yang kaya akan serat, vitamin, dan mineral. Pilih beragam warna untuk mendapatkan nutrisi yang berbeda. Hindari buah dan sayuran yang tidak dicuci dengan baik atau mentah yang berisiko mengandung bakteri.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Bijian utuh \n Sertakan bijian utuh seperti roti gandum, beras merah, dan oatmeal dalam pola makan Anda. Bijian utuh mengandung serat, vitamin, mineral, dan zat besi yang penting.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '4. Susu dan produk olahannya \n Pastikan Anda mendapatkan asupan kalsium yang cukup dengan mengonsumsi susu rendah lemak, yogurt, dan keju rendah lemak. Kalsium diperlukan untuk perkembangan tulang dan gigi bayi.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '5. Lemak sehat \n Pilih lemak sehat, seperti minyak zaitun, alpukat, kacang-kacangan, dan ikan berlemak (seperti salmon), yang mengandung asam lemak omega-3 yang penting untuk perkembangan otak bayi.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '6. Zat besi \n Asupan zat besi yang cukup penting untuk mencegah anemia selama kehamilan. Sumber zat besi termasuk daging merah tanpa lemak, unggas, ikan, biji-bijian, dan makanan yang diperkaya zat besi.',
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
