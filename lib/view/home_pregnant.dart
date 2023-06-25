import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/detailibuhamil.dart';
import 'package:mypregnant/view/riwayatibuhamil.dart';

class HomePregnant extends StatefulWidget {
  const HomePregnant({super.key});

  @override
  State<HomePregnant> createState() => _HomePregnantState();
}

class _HomePregnantState extends State<HomePregnant> {
  int currentPage = 0;
  List<Widget> pages = const [DetailIbuHamil(), RiwayatIbuHamil()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home Pregnant'),
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Daftar Riwayat')
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
