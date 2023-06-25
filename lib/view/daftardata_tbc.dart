import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DaftarTbc extends StatefulWidget {
  const DaftarTbc({super.key});

  @override
  State<DaftarTbc> createState() => _DaftarTbcState();
}

class _DaftarTbcState extends State<DaftarTbc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman Daftar data Tbc')),
    );
  }
}
