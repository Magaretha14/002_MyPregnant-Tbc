import 'package:flutter/material.dart';

class WawasanPregnant extends StatefulWidget {
  const WawasanPregnant({super.key});

  @override
  State<WawasanPregnant> createState() => _WawasanPregnantState();
}

class _WawasanPregnantState extends State<WawasanPregnant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman Wawasan ibu hamil')),
    );
  }
}
