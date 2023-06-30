import 'package:flutter/material.dart';

class DiagnosisGejala extends StatefulWidget {
  const DiagnosisGejala({super.key});

  @override
  State<DiagnosisGejala> createState() => _DiagnosisGejalaState();
}

class _DiagnosisGejalaState extends State<DiagnosisGejala> {
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

        String diagnosisResult = '';

        if (selectedSymptoms.isEmpty) {
          diagnosisResult = 'No symptoms selected.';
        } else if (selectedSymptoms.contains('Demam') ||
            selectedSymptoms.contains('Batuk')) {
          diagnosisResult = 'Gejala ringan';
        } else if (selectedSymptoms.contains('Checkbox 2')) {
          diagnosisResult = 'Diagnosis for Checkbox 2.';
        } else if (selectedSymptoms.contains('Checkbox 3')) {
          diagnosisResult = 'Diagnosis for Checkbox 3.';
        } else {
          diagnosisResult = 'Diagnosis for other combination of symptoms.';
        }

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
