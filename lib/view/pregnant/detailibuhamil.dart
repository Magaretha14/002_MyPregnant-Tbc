import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';

class DetailIbuHamil extends StatefulWidget {
  const DetailIbuHamil({super.key});

  @override
  State<DetailIbuHamil> createState() => _DetailIbuHamilState();
}

class _DetailIbuHamilState extends State<DetailIbuHamil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Text('Halaman Data Ibu Hamil')),
    );
  }
}
