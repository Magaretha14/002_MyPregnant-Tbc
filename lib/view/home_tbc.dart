import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/daftardata_tbc.dart';
import 'package:mypregnant/view/diaggejala.dart';

class HomeTbc extends StatefulWidget {
  const HomeTbc({super.key});

  @override
  State<HomeTbc> createState() => _HomeTbcState();
}

class _HomeTbcState extends State<HomeTbc> {
  int currentPage = 0;
  List<Widget> pages = const [DaftarTbc(), DiagnosisGejala()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Tubercolosis'),
      body: pages[currentPage],
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
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
