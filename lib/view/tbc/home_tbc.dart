import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/tbc/daftardata_tbc.dart';
import 'package:mypregnant/view/tbc/diaggejala.dart';

class HomeTbc extends StatefulWidget {
  const HomeTbc({super.key});

  /// Konstruktor kelas HomeTbc.

  @override
  State<HomeTbc> createState() => _HomeTbcState();

  /// Membuat state untuk HomeTbc.
}

class _HomeTbcState extends State<HomeTbc> {
  int currentPage = 0;

  /// Indeks halaman yang sedang ditampilkan.
  List<Widget> pages = const [DaftarTbc(), DiagnosisGejala()];

  /// Daftar halaman yang dapat ditampilkan.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Tubercolosis'),

      /// Menampilkan app bar dengan judul kustom.
      body: pages[currentPage],

      /// Menampilkan halaman yang sesuai dengan indeks currentPage.
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Daftar Data'),
          NavigationDestination(
              icon: Icon(Icons.add_to_queue_rounded), label: 'Diagnosis Gejala')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;

            /// Mengganti halaman yang ditampilkan berdasarkan indeks yang dipilih.
          });
        },
        selectedIndex: currentPage,

        /// Menandai halaman yang sedang aktif pada bottom navigation bar.
      ),
    );
  }
}
