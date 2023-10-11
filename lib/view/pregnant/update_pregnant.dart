import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypregnant/components/header_detail.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/model/pregnant_model.dart';
import 'package:mypregnant/view/pregnant/home_pregnant.dart';

class UpdatePregnant extends StatefulWidget {
  const UpdatePregnant({
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
  State<UpdatePregnant> createState() => _UpdatePregnantState();

  /// Membuat state untuk UpdatePregnant
}

class _UpdatePregnantState extends State<UpdatePregnant> {
  final _formKey = GlobalKey<FormState>();

  var pregController = PregnantController();

  final TextEditingController _newdatetimeinput = TextEditingController();

  String? newusiajanin;
  String? _newformatDate;
  String? newbbpreg;
  String? newselectedvalue;
  String? newkeluhan;
  String? newtindakan;

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
  void initState() {
    super.initState();
    newselectedvalue = widget.selectedvalue;
    //_formKey = GlobalKey<FormState>();
    _newdatetimeinput.text = widget.formatDate ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerdetail(context, titleText: 'Edit Data Ibu Hamil'),

      /// Tampilan app bar dengan judul 'Edit Data Ibu Hamil'
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
                  onSaved: (value) {
                    newusiajanin = value;
                  },
                  initialValue: widget.usiajanin,

                  /// Nilai awal dari properti widget
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
                  controller: _newdatetimeinput,
                  decoration: InputDecoration(
                    //hintText: "Pilih Tanggal",
                    suffixIcon: const Icon(Icons.event),

                    /// Ikon event untuk input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,

                  /// Input hanya bisa dibaca
                  onTap: () async {
                    DateTime? tanggal = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (tanggal != null) {
                      _newformatDate =
                          DateFormat('dd-MM-yyyy').format(tanggal).toString();
                      setState(() {
                        _newdatetimeinput.text = _newformatDate!;
                      });
                    }
                    print(_newformatDate);
                  },
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
                  onSaved: (value) {
                    newbbpreg = value;
                  },
                  initialValue: widget.bbpreg,

                  /// Nilai awal dari properti widget
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

                    /// Ikon panah drop-down untuk input
                    dropdownColor: const Color.fromARGB(255, 223, 121, 238),

                    /// Warna latar belakang dropdown
                    value: newselectedvalue,

                    /// Nilai terpilih
                    items: generateItems(ket),

                    /// Membuat item-item dropdown
                    onChanged: (item) {
                      setState(() {
                        newselectedvalue = item;

                        /// Mengubah nilai terpilih saat dipilih
                      });
                    },
                  ),
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
                  onSaved: (value) {
                    newkeluhan = value;
                  },
                  initialValue: widget.keluhan,

                  /// Nilai awal dari properti widget
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
                  onSaved: (value) {
                    newtindakan = value;
                  },
                  initialValue: widget.tindakan,

                  /// Nilai awal dari properti widget
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
                        if (_formKey.currentState!.validate()) {
                          /// Validasi form
                          _formKey.currentState!.save();

                          /// Simpan data form
                          PregnantModel pm = PregnantModel(
                              pregid: widget.pregid,
                              usiajanin: newusiajanin!,
                              formatDate: _newdatetimeinput.text,
                              bbpreg: newbbpreg!,
                              selectedvalue: newselectedvalue!,
                              keluhan: newkeluhan!,
                              tindakan: newtindakan!);

                          pregController.updatePreg(pm);

                          /// Memanggil fungsi untuk mengupdate data ibu hamil
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Data Ibu Hamil berhasil diedit')));

                          /// Menampilkan snackbar sukses

                          Navigator.pop(context, true);

                          /// Kembali ke halaman sebelumnya dengan status berhasil
                          Navigator.pop(context, true);

                          /// Kembali ke halaman sebelumnya dengan status berhasil
                        }
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
