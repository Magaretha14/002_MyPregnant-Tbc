import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/tbc_controller.dart';

class DetailDataTbc extends StatefulWidget {
  const DetailDataTbc({super.key});

  @override
  State<DetailDataTbc> createState() => _DetailDataTbcState();
}

class _DetailDataTbcState extends State<DetailDataTbc> {
  var tbcctrl = TbcController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Edit Data Tbc'),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<DocumentSnapshot>>(
              stream: tbcctrl.stream,
              builder: (context, snapshot) {
                // if (!snapshot.hasData) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                // final List<DocumentSnapshot> datatbc = snapshot.data!;

                return SingleChildScrollView(
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
                          'data',
                          style: TextStyle(fontSize: 15),
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
                          'Data',
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
                          'Data',
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
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 235, 137, 252),
                        ),
                        child: Text(
                          'Data',
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
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 235, 137, 252),
                        ),
                        child: Text(
                          'Data',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
