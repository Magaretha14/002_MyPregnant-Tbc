import 'package:flutter/material.dart';
import 'package:mypregnant/view/detailibuhamil.dart';
import 'package:mypregnant/view/home_pregnant.dart';
import 'package:mypregnant/view/riwayatibuhamil.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int pageIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            HomePregnant(),
            RiwayatIbuHamil(),
            // TextButton(onPressed: authController.logout, child: Text('Logout')),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home Pregnant'),
          NavigationDestination(
              icon: Icon(Icons.list_alt_rounded), label: 'Daftar Riwayat')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        selectedIndex: pageIndex,
      ),
    );
  }
}
