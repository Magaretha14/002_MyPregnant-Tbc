import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePregnant extends StatefulWidget {
  const HomePregnant({super.key});

  @override
  State<HomePregnant> createState() => _HomePregnantState();
}

class _HomePregnantState extends State<HomePregnant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman Utama Pregnant')),
    );
  }
}
