import 'package:flutter/material.dart';
import 'package:mypregnant/view/pregnant/content/saranmakan.dart';
import 'package:mypregnant/view/pregnant/content/sarantidur.dart';
import 'package:mypregnant/view/pregnant/content/stunting.dart';
import 'package:mypregnant/view/pregnant/content/tips_menyusui.dart';
import 'package:mypregnant/view/pregnant/content/tipshamil.dart';
import 'package:mypregnant/view/pregnant/content/tipskerja_hamil.dart';

class WawasanPregnant extends StatefulWidget {
  const WawasanPregnant({super.key});

  @override
  State<WawasanPregnant> createState() => _WawasanPregnantState();
}

class _WawasanPregnantState extends State<WawasanPregnant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),

          /// Spasi atas
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TipsHamil()),

                      /// Navigasi ke halaman TipsHamil saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/tipskehamilanbutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaranMakanan()),

                      /// Navigasi ke halaman SaranMakanan saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 108, 201, 244),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/saranmakananibuhamilbutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// Spasi
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaranTidur()),

                      /// Navigasi ke halaman SaranTidur saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/sarantidurbutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TipsMenyusui()),

                      /// Navigasi ke halaman TipsMenyusui saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 108, 201, 244),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/tipsmenyusuibutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// Spasi
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TipsKerja()),

                      /// Navigasi ke halaman TipsKerja saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/tipskerjasaathamidunbutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Stunting()),

                      /// Navigasi ke halaman Stunting saat gambar ditekan
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 108, 201, 244),

                      /// Warna latar belakang
                      borderRadius: BorderRadius.circular(20),

                      /// Bentuk border
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/stuntingbutton.png',

                        /// Gambar yang ditampilkan
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
