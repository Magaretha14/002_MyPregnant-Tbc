import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/controller/pregnant_controller.dart';
import 'package:mypregnant/view/pregnant/add_pregnant.dart';
import 'package:mypregnant/view/pregnant/detailibuhamil.dart';

/// A widget for displaying a list of pregnant records.
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailIbuHamil(
                                  pregid: datapreg[index]['pregid'],
                                  usiajanin: datapreg[index]['usiajanin'],
                                  formatDate: datapreg[index]['formatDate'],
                                  bbpreg: datapreg[index]['bbpreg'],
                                  selectedvalue: datapreg[index]
                                      ['selectedvalue'],
                                  keluhan: datapreg[index]['keluhan'],
                                  tindakan: datapreg[index]['tindakan'],
                                ),
                              ),
                            ).then((value) {
                              if (value == true) {
                                setState(() {
                                  pregctrl.getPreg();
                                });
                              }
                            });
                            print(datapreg[index]['formatDate'].toString());
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(datapreg[index]['usiajanin']),
                              leading: const Text('Minggu ke '),
                              subtitle: Text(
                                  datapreg[index]['formatDate'].toString()),
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
          ).then((value) {
            if (value == true) {
              setState(() {
                pregctrl.getPreg();
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
