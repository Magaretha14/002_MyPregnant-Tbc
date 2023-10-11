import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/pregnant/daftar_pregnant.dart';
import 'package:mypregnant/view/pregnant/wawasan_ibuhamil.dart';

class HomePregnant extends StatefulWidget {
  const HomePregnant({super.key});

  /// Konstruktor untuk HomePregnant

  @override
  State<HomePregnant> createState() => _HomePregnantState();

  /// Membuat state untuk HomePregnant
}

class _HomePregnantState extends State<HomePregnant> {
  int currentPage = 0;

  /// Menyimpan indeks halaman saat ini
  List<Widget> pages = const [DaftarPregnant(), WawasanPregnant()];

  /// Daftar halaman yang tersedia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Pregnant'),

      /// Menampilkan app bar dengan judul 'Pregnant'
      body: pages[currentPage],

      /// Menampilkan halaman sesuai dengan currentPage
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Data Pemeriksaan'),

          /// Destinasi 1 - Data Pemeriksaan
          NavigationDestination(
              icon: Icon(Icons.widgets_outlined), label: 'Outlook')

          /// Destinasi 2 - Outlook
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;

            /// Mengubah currentPage sesuai dengan indeks yang dipilih pada bottom navigation bar
          });
        },
        selectedIndex: currentPage,

        /// Menyimpan indeks halaman saat ini yang dipilih
      ),
    );
  }
}
