import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/pregnant/home_pregnant.dart';
import 'package:mypregnant/view/tbc/home_tbc.dart';

import '../controller/auth_controller.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'My Pregnant & Tbc'),

      /// Membuat AppBar dengan judul 'My Pregnant & Tbc'.
      body: SafeArea(
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
                      image: AssetImage('images/tipspreg.png'),

                      /// Menampilkan gambar tipspreg.png dengan latar belakang warna pink.
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/tbc.png'),

                      /// Menampilkan gambar tbc.png dengan latar belakang warna ungu.
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePregnant()),

                      /// Navigasi ke halaman HomePregnant saat gambar ditekan.
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/iconhamil.png',

                        /// Menampilkan gambar iconhamil.png dengan latar belakang warna tertentu.
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
                      MaterialPageRoute(builder: (context) => HomeTbc()),

                      /// Navigasi ke halaman HomeTbc saat gambar ditekan.
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 108, 201, 244),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/icontbc.png',

                        /// Menampilkan gambar icontbc.png dengan latar belakang warna tertentu.
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
