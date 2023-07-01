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
  State<UpdatePregnant> createState() => _UpdatePregnantState();
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
                  onSaved: (value) {
                    newusiajanin = value;
                  },
                  initialValue: widget.usiajanin,
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
                  controller: _newdatetimeinput,
                  decoration: InputDecoration(
                    //hintText: "Pilih Tanggal",
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
                    //print(_newformatDate);
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
                  onSaved: (value) {
                    newbbpreg = value;
                  },
                  initialValue: widget.bbpreg,
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
                    value: newselectedvalue,
                    items: generateItems(ket),
                    onChanged: (item) {
                      setState(() {
                        newselectedvalue = item;
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
                          PregnantModel pm = PregnantModel(
                              pregid: widget.pregid,
                              usiajanin: newusiajanin!,
                              formatDate: _newdatetimeinput.text,
                              bbpreg: newbbpreg!,
                              selectedvalue: newselectedvalue!,
                              keluhan: newkeluhan!,
                              tindakan: newtindakan!);

                          pregController.updatePreg(pm);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Data Ibu Hamil berhasil diedit')));

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePregnant(),
                            ),
                          );
                        }
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
