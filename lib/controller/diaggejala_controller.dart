import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/diaggejala_model.dart';

class DiaggejalaController {
  final diagCollection = FirebaseFirestore.instance.collection('diagnosis');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addDiagnosis(DiaggejalaModel diagmodel) async {
    final diag = diagmodel.toMap();

    final DocumentReference docRef = await diagCollection.add(diag);

    final String docId = docRef.id;

    final DiaggejalaModel diagModel = DiaggejalaModel(
      diagid: docId,
      selectedSymptoms: diagmodel.selectedSymptoms,
      diagnosisResult: diagmodel.diagnosisResult,
    );

    await docRef.update(diagModel.toMap());
  }
}
