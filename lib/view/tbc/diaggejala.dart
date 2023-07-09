import 'package:flutter/material.dart';
import 'package:mypregnant/controller/diaggejala_controller.dart';
import 'package:mypregnant/model/diaggejala_model.dart';

class DiagnosisGejala extends StatefulWidget {
  const DiagnosisGejala({super.key});

  @override
  State<DiagnosisGejala> createState() => _DiagnosisGejalaState();
}

class _DiagnosisGejalaState extends State<DiagnosisGejala> {
  var diagctrl = DiaggejalaController();
  List<Map<String, dynamic>> data = [
    {
      'id': 'Sesak Nafas',
      'value': false,
    },
    {
      'id': 'Urine Berdarah',
      'value': false,
    },
    {
      'id': 'Nyeri Punggung',
      'value': false,
    },
    {
      'id': 'Pembengkakan kelenjar getah bening',
      'value': false,
    },
    {
      'id': 'Sakit Perut Hebat',
      'value': false,
    },
    {
      'id': 'Sakit kepala dan kejang',
      'value': false,
    }
  ];

  bool showDiagnosis = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Daignosis gejala TBC pada organ lain',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(data[index]['id']),
                    value: data[index]['value'],
                    onChanged: (value) {
                      setState(() {
                        data[index]['value'] = value;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 100.0), // Atur jarak vertical sesuai kebutuhan
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDiagnosis = true;
                  });
                  showDiagnosisDialog();
                },
                child: const Text(
                  'Lihat Hasil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDiagnosisDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> selectedSymptoms = [];

        for (var item in data) {
          if (item['value']) {
            selectedSymptoms.add(item['id']);
          }
        }

        String diagnosisResult;

        if (selectedSymptoms.isEmpty) {
          diagnosisResult = 'Tidak ada gejala yang dipilih';
        } else if (selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC Paru - Paru';
        } else if (selectedSymptoms.contains('Urine Berdarah') ||
            selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC Ginjal';
        } else if (selectedSymptoms.contains('Nyeri Punggung') ||
            selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC Tulang Belakang';
        } else if (selectedSymptoms
                .contains('Pembengkakan kelenjar getah bening') ||
            selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC Kelenjar';
        } else if (selectedSymptoms.contains('Sakit Perut Hebat') ||
            selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC Usus';
        } else if (selectedSymptoms.contains('Sakit kepala dan kejang') ||
            selectedSymptoms.contains('Sesak Nafas')) {
          diagnosisResult = 'TBC di Otak';
        } else {
          diagnosisResult =
              'tidak sesuai dengan diagnosis yang ada silahkan ke rumah sakit';
        }
        DiaggejalaModel dm = DiaggejalaModel(
            selectedSymptoms: selectedSymptoms,
            diagnosisResult: diagnosisResult,
            diagid: '');
        diagctrl.addDiagnosis(dm);

        return AlertDialog(
          title: const Text('Diagnosis Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Gejala yang dipilih:'),
              const SizedBox(height: 8),
              Text(selectedSymptoms.join(', ')),
              const SizedBox(height: 16),
              const Text('Hasil Diagnosis:'),
              const SizedBox(height: 8),
              // Add your diagnosis result text here based on selected symptoms
              Text(diagnosisResult),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
