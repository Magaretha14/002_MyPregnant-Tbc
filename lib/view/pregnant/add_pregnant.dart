import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/model/pregnant_model.dart';
import 'package:mypregnant/view/pregnant/home_pregnant.dart';

class AddPregnant extends StatefulWidget {
  const AddPregnant({super.key});

  @override
  State<AddPregnant> createState() => _AddPregnantState();
}

class _AddPregnantState extends State<AddPregnant> {
  final _formKey = GlobalKey<FormState>();

  var pregController = PregnantController();

  String? usiajanin;
  String? formatDate;
  String? bbpreg;
  String? selectedvalue;
  String? keluhan;
  String? tindakan;

  final TextEditingController datetimeinput = TextEditingController();

  final TextEditingController _controllerUsiaJanin = TextEditingController();
  final TextEditingController _controllerBb = TextEditingController();
  final TextEditingController _controllerKeluhan = TextEditingController();
  final TextEditingController _controllerTindakan = TextEditingController();

  List<String> ket = ['Ya', 'Tidak'];

  List<DropdownMenuItem> generateItems(List<String> ket) {
    List<DropdownMenuItem> items = [];
    for (var item in ket) {
      items.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Tambah Data Pregnant"),
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
                  controller: _controllerUsiaJanin,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Masukkan umur kehamilan (minggu)",
                    prefixIcon: const Icon(Icons.calendar_view_day_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    usiajanin = value;
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
                  controller: datetimeinput,
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
                  onTap: () async {
                    DateTime? tanggal = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (tanggal != null) {
                      formatDate = DateFormat('dd-MM-yyyy').format(tanggal);

                      setState(() {
                        datetimeinput.text = formatDate.toString();
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
                  onChanged: (value) {
                    bbpreg = value;
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
                    'Kaki bengkak :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 250),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                    dropdownColor: const Color.fromARGB(255, 223, 121, 238),
                    value: selectedvalue,
                    items: generateItems(ket),
                    onChanged: (item) {
                      setState(() {
                        selectedvalue = item;
                      });
                    },
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
                  onChanged: (value) {
                    keluhan = value;
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '*jika tidak ada keluhan isi dengan tanda " - " saja',
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
                          PregnantModel pm = PregnantModel(
                              usiajanin: usiajanin!,
                              formatDate: datetimeinput.text,
                              bbpreg: bbpreg!,
                              selectedvalue: selectedvalue!,
                              keluhan: keluhan!,
                              tindakan: tindakan!);

                          pregController.addPregnant(pm);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Ibu Hamil ditambahkan')));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePregnant(),
                            ),
                          );
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
