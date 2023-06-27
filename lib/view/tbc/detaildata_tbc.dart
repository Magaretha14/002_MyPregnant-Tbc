import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/tbc_controller.dart';

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
  final DateTime? datetime;
  final String? bb;
  final String? keluhan;
  final String? tindakan;
}

class _DetailDataTbcState extends State<DetailDataTbc> {
  final _formKey = GlobalKey<FormState>();
  var tbcctrl = TbcController();

  String? newhari;
  DateTime? newdatetime;
  String? newbb;
  String? newkeluhan;
  String? newtindakan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Detail Data Tbc'),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text(
                  "Tambahkan Data Perkembangan Penyakit Tbc Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

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
                TextFormField(
                  keyboardType: TextInputType.name,
                  readOnly: true,
                  decoration: InputDecoration(
                    //hintText: "Masukkan hari ke",
                    prefixIcon: const Icon(Icons.calendar_view_day_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    newhari = value;
                  },
                  initialValue: widget.hari,
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: const Text(
                //     '*hanya masukan angkanya saja, contoh : 1',
                //     style: TextStyle(
                //         color: Colors.red,
                //         fontSize: 15,
                //         fontStyle: FontStyle.italic),
                //   ),
                // ),
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
                GestureDetector(
                  child: AbsorbPointer(
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: widget.datetime?.toString() ?? ''),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Pilih tanggal',
                        suffixIcon: const Icon(Icons.event),
                      ),
                      initialValue: widget.datetime.toString(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Berat badan :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan berat badan anda",
                    prefixIcon: const Icon(Icons.boy_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    newbb = value;
                  },
                  initialValue: widget.bb,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*contoh : 40 Kg',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
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
                TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan keluhan anda",
                    prefixIcon: const Icon(Icons.sick),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    newkeluhan = value;
                  },
                  initialValue: widget.keluhan,
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
                TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan tindakan",
                    prefixIcon: const Icon(Icons.local_hospital_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    newtindakan = value;
                  },
                  initialValue: widget.tindakan,
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: const Text(
                //     '*jika tidak ada tindakan isi dengan tanda " - " saja',
                //     style: TextStyle(
                //         color: Colors.red,
                //         fontSize: 15,
                //         fontStyle: FontStyle.italic),
                //   ),
                // ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
