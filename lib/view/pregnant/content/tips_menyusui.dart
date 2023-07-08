import 'package:flutter/material.dart';

class TipsMenyusui extends StatelessWidget {
  const TipsMenyusui({super.key});

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
                          image: AssetImage('images/tipsmenyusui.png'),
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
                  'Tips Menyusui : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Persiapan sebelum menyusui \n Pastikan Anda dan bayi dalam posisi yang baik dan nyaman.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. Posisi yang benar \n Pastikan bayi berada dalam posisi yang baik, dengan kepala, leher, dan tubuhnya sejajar.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Frekuensi dan durasi \n Berikan ASI (Air Susu Ibu) sesuai kebutuhan bayi, biasanya 8-12 kali dalam 24 jam pada awalnya.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '4. Perhatikan tanda-tanda bayi yang lapar \n Carilah tanda-tanda khas lapar, seperti menghisap jari atau merengek,',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '5. Perawatan diri \n Makan makanan yang sehat dan seimbang untuk memenuhi kebutuhan gizi Anda dan mendukung produksi ASI.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '6. Dukungan sosial \n Cari dukungan dari pasangan, keluarga, atau teman-teman yang dapat memberikan dukungan emosional dan praktis selama proses menyusui.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '7. Jangan ragu untuk meminta bantuan \n Jika Anda mengalami masalah atau kekhawatiran dalam menyusui, jangan ragu untuk berkonsultasi dengan konsultan laktasi atau penyedia layanan kesehatan yang berpengalaman dalam menyusui.',
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
