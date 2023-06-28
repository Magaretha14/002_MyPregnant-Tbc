import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/view/pregnant/add_pregnant.dart';

class DaftarPregnant extends StatefulWidget {
  const DaftarPregnant({super.key});

  @override
  State<DaftarPregnant> createState() => _DaftarPregnantState();
}

class _DaftarPregnantState extends State<DaftarPregnant> {
  var pregctrl = PregnantController();

  @override
  void initState() {
    pregctrl.getPreg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: pregctrl.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> datapreg = snapshot.data!;

                  return ListView.builder(
                    itemCount: datapreg.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onLongPress: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailDataTbc(
                            //         tbcid: datatbc[index]['tbcid'],
                            //         hari: datatbc[index]['hari'],
                            //         datetime: datatbc[index]['datetime'],
                            //         bb: datatbc[index]['beratbadan'],
                            //         keluhan: datatbc[index]['keluhan'],
                            //         tindakan: datatbc[index]['tindakan']),
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(datapreg[index]['usiajanin']),
                              leading: const Text('Minggu ke '),
                              subtitle:
                                  Text(datapreg[index]['tanggal'].toString()),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  pregctrl.removePreg(
                                      datapreg[index]['pregid'].toString());
                                  setState(() {
                                    pregctrl.getPreg();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Data Ibu Hamil Dihapus')));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPregnant(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
