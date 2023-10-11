import 'package:flutter/material.dart';

import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/tbc_controller.dart';
import 'package:mypregnant/view/tbc/update_tbc.dart';

class DetailDataTbc extends StatefulWidget {
  const DetailDataTbc({
    Key? key,
    this.tbcid,

    /// ID unik untuk data TBC.
    this.hari,

    /// Hari pengobatan.
    this.formattgl,

    /// Tanggal pengobatan yang diformat.
    this.bb,

    /// Berat badan.
    this.keluhan,

    /// Keluhan pasien.
    this.tindakan,

    /// Tindakan yang diberikan.
  }) : super(key: key);

  @override
  State<DetailDataTbc> createState() => _DetailDataTbcState();

  final String? tbcid;
  final String? hari;
  final String? formattgl;
  final String? bb;
  final String? keluhan;
  final String? tindakan;
}

class _DetailDataTbcState extends State<DetailDataTbc> {
  final _formKey = GlobalKey<FormState>();

  var tbcctrl = TbcController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Detail Data Tbc'),

      /// Menampilkan app bar dengan judul kustom.
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,

      /// Mengatur warna latar belakang berdasarkan tema.
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// Menambahkan jarak atas.
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_view_day_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  // onSaved: (value) {
                  //   newhari = value;
                  // },
                  initialValue: widget.hari,
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
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.event),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.formattgl,
                  readOnly: true,
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.boy_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  // onSaved: (value) {
                  //   newberatbadan = value;
                  // },
                  initialValue: widget.bb,
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.sick),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  // onSaved: (value) {
                  //   newkeluhan = value;
                  // },
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.local_hospital_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  // onSaved: (value) {
                  //   newtindakan = value;
                  // },
                  initialValue: widget.tindakan,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateTbc(
                                tbcid: widget.tbcid,
                                hari: widget.hari,
                                formattgl: widget.formattgl,
                                bb: widget.bb,
                                keluhan: widget.keluhan,
                                tindakan: widget.tindakan),
                          ),
                        ).then((value) {
                          if (value == true) {
                            setState(() {
                              tbcctrl.getTbc();
                            });
                          }
                        });
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
