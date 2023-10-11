import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_detail.dart';

class Stunting extends StatelessWidget {
  const Stunting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Tips terhindar dari stunting'),

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
                          image: AssetImage('images/stunting.png'),

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
                  'Tips Terhindar Dari Stunting : ',

                  /// Title text.
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Gizi yang seimbang \n Pastikan anak mendapatkan gizi yang cukup dari makanan yang seimbang dan bergizi. Sertakan makanan yang kaya akan protein, karbohidrat, lemak sehat, vitamin, dan mineral dalam makanan sehari-hari anak.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. ASI eksklusif \n Jika memungkinkan, berikan ASI eksklusif kepada bayi selama enam bulan pertama kehidupannya. ASI mengandung zat gizi penting dan melindungi bayi dari infeksi yang dapat menghambat pertumbuhannya.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Makanan pendamping ASI \n Setelah usia enam bulan, perkenalkan makanan pendamping ASI secara bertahap. Berikan makanan yang beragam, termasuk sayuran, buah-buahan, biji-bijian, protein (daging, ikan, tahu, tempe), dan produk susu.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '4. Suplemen gizi \n Jika diperlukan, konsultasikan dengan dokter atau petugas kesehatan untuk menentukan apakah anak memerlukan suplemen gizi tambahan, seperti suplemen zat besi, vitamin A, atau vitamin D.',
                  textAlign: TextAlign.justify,

                  /// Text alignment.
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '5. Makanan bersih dan aman \n Pastikan makanan yang dikonsumsi anak bersih dan aman. Cuci tangan sebelum menyiapkan makanan dan sebelum makan, hindari makanan mentah atau setengah matang yang berisiko menyebabkan infeksi.',
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
