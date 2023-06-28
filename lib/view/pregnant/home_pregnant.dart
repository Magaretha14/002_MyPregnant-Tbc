import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/pregnant/daftar_pregnant.dart';
import 'package:mypregnant/view/pregnant/detailibuhamil.dart';
import 'package:mypregnant/view/pregnant/wawasan_ibuhamil.dart';
import 'package:mypregnant/view/tbc/daftardata_tbc.dart';

class HomePregnant extends StatefulWidget {
  const HomePregnant({super.key});

  @override
  State<HomePregnant> createState() => _HomePregnantState();
}

class _HomePregnantState extends State<HomePregnant> {
  int currentPage = 0;
  List<Widget> pages = const [DaftarPregnant(), WawasanPregnant()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Pregnant'),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Data Pemeriksaan'),
          NavigationDestination(
              icon: Icon(Icons.widgets_outlined), label: 'Outlook')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
