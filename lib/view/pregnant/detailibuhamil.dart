import 'package:flutter/material.dart';

import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/view/pregnant/update_pregnant.dart';

class DetailIbuHamil extends StatefulWidget {
  const DetailIbuHamil({
    Key? key,
    this.pregid,
    this.usiajanin,
    this.formatDate,
    this.bbpreg,
    this.selectedvalue,
    this.keluhan,
    this.tindakan,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Detail Data Ibu Hamil'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                  // onChanged: (value) {
                  //   usiajanin = value;
                  // },
                  initialValue: widget.usiajanin,
                  readOnly: true,
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
                  // onChanged: (value) {
                  //   bbpreg = value;
                  // },
                  initialValue: widget.formatDate,
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
                  // onChanged: (value) {
                  //   bbpreg = value;
                  // },
                  initialValue: widget.bbpreg,
                  readOnly: true,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Kaki bengkak :',
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  initialValue: widget.selectedvalue,
                  readOnly: true,
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
                  // onChanged: (value) {
                  //   keluhan = value;
                  // },
                  initialValue: widget.keluhan,
                  readOnly: true,
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
                  // onChanged: (value) {
                  //   tindakan = value;
                  // },
                  initialValue: widget.tindakan,
                  readOnly: true,
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
                            builder: (context) => UpdatePregnant(
                                pregid: widget.pregid,
                                usiajanin: widget.usiajanin,
                                formatDate: widget.formatDate,
                                bbpreg: widget.bbpreg,
                                selectedvalue: widget.selectedvalue,
                                keluhan: widget.keluhan,
                                tindakan: widget.tindakan),
                          ),
                        );
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
