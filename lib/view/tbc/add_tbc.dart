import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/controller/tbc_controller.dart';
import 'package:mypregnant/model/tbc_model.dart';
import 'package:mypregnant/view/tbc/home_tbc.dart';

/// A widget for adding a new TBC record.
class AddTbc extends StatefulWidget {
  const AddTbc({super.key});

  @override
  State<AddTbc> createState() => _AddTbcState();
}

class _AddTbcState extends State<AddTbc> {
  final _formKey = GlobalKey<FormState>();

  var tbcController = TbcController();

  final TextEditingController _controllerHari = TextEditingController();
  final TextEditingController _controllerBb = TextEditingController();
  final TextEditingController _controllerKeluhan = TextEditingController();
  final TextEditingController _controllerTindakan = TextEditingController();

  final TextEditingController inputtgl = TextEditingController();

  String? hari;
  String? formattgl;
  String? beratbadan;
  String? keluhan;
  String? tindakan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Tambah Data Tbc"),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                  controller: _controllerHari,
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
                  validator: validateHari,
                  onChanged: (value) {
                    hari = value;
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*hanya masukan angkanya saja, contoh : 1',
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
                  controller: inputtgl,
                  decoration: InputDecoration(
                    hintText: "Pilih Tanggal",
                    suffixIcon: const Icon(Icons.event),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  validator: validateTanggal,
                  onTap: () async {
                    DateTime? picktanggal = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picktanggal != null) {
                      formattgl = DateFormat('dd-MM-yyyy').format(picktanggal);

                      setState(() {
                        inputtgl.text = formattgl.toString();
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
                  controller: _controllerBb,
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
                  validator: validateBb,
                  onChanged: (value) {
                    beratbadan = value;
                  },
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
                  controller: _controllerKeluhan,
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
                  validator: validateKeluhan,
                  onChanged: (value) {
                    keluhan = value;
                  },
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
                  controller: _controllerTindakan,
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
                  validator: validateTindakan,
                  onChanged: (value) {
                    tindakan = value;
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*jika tidak ada tindakan isi dengan tanda " - " saja',
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
                              hari: hari!,
                              formattgl: inputtgl.text,
                              beratbadan: beratbadan!,
                              keluhan: keluhan!,
                              tindakan: tindakan!);

                          tbcController.addTbc(tm);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Tbc Added')));

                          Navigator.pop(context, true);
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

/// Validation function for the "Hari ke" field.
String? validateHari(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan Hari ke - ";
  }
  return null;
}

/// Validation function for the "Tanggal" field.
String? validateTanggal(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan tanggal ";
  }
  return null;
}

/// Validation function for the "Berat Badan" field.
String? validateBb(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan berat badan anda ";
  }
  return null;
}

/// Validation function for the "Keluhan" field.
String? validateKeluhan(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan keluhan anda ";
  }
  return null;
}

/// Validation function for the "Tindakan" field.
String? validateTindakan(String? value) {
  if (value == null || value.isEmpty) {
    return "Tolong masukan tindakan";
  }
  return null;
}
