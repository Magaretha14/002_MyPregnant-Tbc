import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeTbc extends StatefulWidget {
  const HomeTbc({super.key});

  @override
  State<HomeTbc> createState() => _HomeTbcState();
}

class _HomeTbcState extends State<HomeTbc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman utama Tbc')),
    );
  }
}
