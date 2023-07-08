import 'package:flutter/material.dart';

class TipsKerja extends StatefulWidget {
  const TipsKerja({super.key});

  @override
  State<TipsKerja> createState() => _TipsKerjaState();
}

class _TipsKerjaState extends State<TipsKerja> {
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
                          image: AssetImage('images/tipskerjasaathamidun.png'),
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
                  'Tips Bekerja Saat Hamil : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '1. Buat jadwal yang seimbang \n Usahakan untuk mengatur jadwal kerja yang seimbang dan hindari bekerja terlalu lama atau terlalu lelah. Istirahat secara teratur dan pastikan Anda mendapatkan waktu tidur yang cukup di malam hari.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '2. Perhatikan postur tubuh \n Pastikan Anda duduk dengan posisi yang nyaman dan memiliki dukungan yang baik untuk punggung Anda. Gunakan kursi yang ergonomis dan pastikan meja kerja Anda sesuai dengan tinggi Anda.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '3. Lakukan peregangan dan olahraga ringan \n Lakukan peregangan dan gerakan ringan di tempat kerja untuk menjaga sirkulasi dan mengurangi kekakuan tubuh. Pastikan untuk berbicara dengan dokter kandungan Anda tentang jenis olahraga yang aman untuk dilakukan selama kehamilan.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '4. Ambil cuti atau waktu kerja fleksibel \n Jika memungkinkan, pertimbangkan mengambil cuti atau mengatur waktu kerja yang lebih fleksibel menjelang persalinan atau saat bayi baru lahir. Ini akan memberi Anda waktu untuk istirahat dan menyesuaikan diri dengan perubahan yang terjadi.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  '5. Jangan ragu untuk meminta bantuan \n Jika Anda merasa kewalahan atau memiliki kekhawatiran terkait bekerja saat hamil, jangan ragu untuk mencari dukungan dari pasangan, keluarga, atau teman-teman. Juga, konsultasikan dengan dokter kandungan Anda untuk saran yang lebih spesifik sesuai dengan situasi Anda.',
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
