import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';

class RiwayatIbuHamil extends StatefulWidget {
  const RiwayatIbuHamil({super.key});

  @override
  State<RiwayatIbuHamil> createState() => _RiwayatIbuHamilState();
}

class _RiwayatIbuHamilState extends State<RiwayatIbuHamil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman Riwayat ibu hamil')),
    );
  }
}
