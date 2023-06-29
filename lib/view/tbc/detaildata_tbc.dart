import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/view/tbc/update_tbc.dart';

class DetailDataTbc extends StatefulWidget {
  const DetailDataTbc({
    Key? key,
    this.tbcid,
    this.hari,
    this.datetime,
    this.bb,
    this.keluhan,
    this.tindakan,
  }) : super(key: key);

  @override
  State<DetailDataTbc> createState() => _DetailDataTbcState();

  final String? tbcid;
  final String? hari;
  final String? datetime;
  final String? bb;
  final String? keluhan;
  final String? tindakan;
}

class _DetailDataTbcState extends State<DetailDataTbc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Detail Data Tbc'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
          child: Form(
              child: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Hari ke :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 295),
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 235, 137, 252),
              ),
              child: Text(
                '${widget.hari}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Tanggal :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(right: 100),
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 235, 137, 252),
              ),
              child: Text(
                '${widget.datetime}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Berat Badan :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(right: 250),
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 235, 137, 252),
              ),
              child: Text(
                '${widget.bb}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Keluhan :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 235, 137, 252),
              ),
              child: Text(
                '${widget.keluhan}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Tindakan :',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 235, 137, 252),
              ),
              child: Text(
                '${widget.tindakan}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //final List<DocumentSnapshot> datatbc = snapshot.data!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTbc(
                          tbcid: widget.tbcid,
                          hari: widget.hari,
                          datetime: widget.datetime,
                          bb: widget.bb,
                          keluhan: widget.keluhan,
                          tindakan: widget.tindakan),
                    ),
                  );
                },
                child: const Text('Edit'))
          ],
        ),
      ))),
    );
  }
}
