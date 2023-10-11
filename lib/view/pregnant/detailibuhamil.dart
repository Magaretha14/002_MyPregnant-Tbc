import 'package:flutter/material.dart';

import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/model/pregnant_model.dart';
import 'package:mypregnant/view/pregnant/update_pregnant.dart';

class DetailIbuHamil extends StatefulWidget {
  const DetailIbuHamil({
    Key? key,
    this.pregid,

    /// ID ibu hamil
    this.usiajanin,

    /// Usia kehamilan
    this.formatDate,

    /// Format tanggal
    this.bbpreg,

    /// Berat badan ibu hamil
    this.selectedvalue,

    /// Nilai terpilih (kaki bengkak)
    this.keluhan,

    /// Keluhan
    this.tindakan,

    /// Tindakan yang diambil
  }) : super(key: key);

  final String? pregid;
  final String? usiajanin;
  final String? formatDate;
  final String? bbpreg;
  final String? selectedvalue;
  final String? keluhan;
  final String? tindakan;

  @override
  State<DetailIbuHamil> createState() => _DetailIbuHamilState();
}

class _DetailIbuHamilState extends State<DetailIbuHamil> {
  final _formKey = GlobalKey<FormState>();

  var pregController = PregnantController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pregController.getPreg();

    /// Mengambil data ibu hamil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Detail Data Ibu Hamil'),

      /// Tampilan app bar kustom
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,

      /// Set warna latar belakang
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Umur Kehamilan :',

                    /// Label usia kehamilan
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

                    /// Ikon kalender untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.usiajanin,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 10),

                /// Spasi
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tanggal :',

                    /// Label tanggal
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

                    /// Ikon event untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.formatDate,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 10),

                /// Spasi
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Berat badan :',

                    /// Label berat badan
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

                    /// Ikon anak laki-laki untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.bbpreg,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 10),

                /// Spasi
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Kaki bengkak :',

                    /// Label kaki bengkak
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
                    prefixIcon: const Icon(Icons.airline_seat_legroom_extra),

                    /// Ikon kursi pesawat untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.selectedvalue,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 10),

                /// Spasi
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Keluhan :',

                    /// Label keluhan
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

                    /// Ikon sakit untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.keluhan,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 10),

                /// Spasi
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tindakan :',

                    /// Label tindakan
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

                    /// Ikon rumah sakit untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.tindakan,

                  /// Nilai awal dari properti widget
                  readOnly: true,

                  /// Input hanya bisa dibaca
                ),
                const SizedBox(height: 30),

                /// Spasi
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
                            builder: (context) => UpdatePregnant(
                                pregid: widget.pregid,
                                usiajanin: widget.usiajanin,
                                formatDate: widget.formatDate,
                                bbpreg: widget.bbpreg,
                                selectedvalue: widget.selectedvalue,
                                keluhan: widget.keluhan,
                                tindakan: widget.tindakan),
                          ),
                        ).then((value) {
                          if (value == true) {
                            setState(() {
                              pregController.getPreg();
                            });
                          }
                        });
                      },
                      child: const Text("Edit"),

                      /// Tombol Edit
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
