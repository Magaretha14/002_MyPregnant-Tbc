import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/tbc_controller.dart';
import 'package:mypregnant/model/tbc_model.dart';
import 'package:mypregnant/view/tbc/home_tbc.dart';

/// Kelas ini mewakili StatefulWidget untuk mengupdate data Tbc.
class UpdateTbc extends StatefulWidget {
  const UpdateTbc({
    Key? key,
    this.tbcid,
    this.hari,
    this.formattgl,
    this.bb,
    this.keluhan,
    this.tindakan,
  }) : super(key: key);

  @override
  State<UpdateTbc> createState() => _UpdateTbcState();

  final String? tbcid;
  final String? hari;
  final String? formattgl;
  final String? bb;
  final String? keluhan;
  final String? tindakan;
}

/// Kelas ini mewakili state untuk mengupdate data Tbc.
class _UpdateTbcState extends State<UpdateTbc> {
  final _formKey = GlobalKey<FormState>();

  var tbcController = TbcController();

  String? newhari;
  String? newformattgl;
  String? newberatbadan;
  String? newkeluhan;
  String? newtindakan;

  final TextEditingController newinputtgl = TextEditingController();

  @override
  void initState() {
    // Inisialisasi tanggal input dengan nilai awal dari widget.
    newinputtgl.text = widget.formattgl ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Edit Data tbc'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
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
                  decoration: InputDecoration(
                    hintText: "Masukkan hari ke",
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*hanya masukkan angkanya saja, contoh: 1',
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
                    'Tanggal :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFormField(
                  controller: newinputtgl,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.event),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? picktanggal = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picktanggal != null) {
                      newformattgl = DateFormat('dd-MM-yyyy')
                          .format(picktanggal)
                          .toString();
                      setState(() {
                        newinputtgl.text = newformattgl!;
                      });
                    }
                  },
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
                    newberatbadan = value;
                  },
                  initialValue: widget.bb,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*contoh: 40 Kg',
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
                  onSaved: (value) {
                    newtindakan = value;
                  },
                  initialValue: widget.tindakan,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*jika tidak ada tindakan, isi dengan tanda "-" saja',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
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
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          TbcModel tm = TbcModel(
                              tbcid: widget.tbcid,
                              hari: newhari!.toString(),
                              formattgl: newinputtgl.text,
                              beratbadan: newberatbadan!.toString(),
                              keluhan: newkeluhan!.toString(),
                              tindakan: newtindakan!.toString());

                          tbcController.updateTbc(tm);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Anda telah diedit')));

                          Navigator.pop(context, true);
                          Navigator.pop(context, true);

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeTbc(),
                          //   ),
                          // );
                        }
                      },
                      child: const Text("Simpan"),
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
