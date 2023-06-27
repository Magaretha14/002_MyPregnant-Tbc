import 'package:flutter/material.dart';

class DiagnosisGejala extends StatefulWidget {
  const DiagnosisGejala({super.key});

  @override
  State<DiagnosisGejala> createState() => _DiagnosisGejalaState();
}

class _DiagnosisGejalaState extends State<DiagnosisGejala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Halaman Data diagnosis gejala')),
    );
  }
}
