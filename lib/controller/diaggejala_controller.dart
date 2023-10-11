import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/diaggejala_model.dart';

class DiaggejalaController {
  final diagCollection = FirebaseFirestore.instance.collection('diagnosis');

  /// Mengakses koleksi 'diagnosis' di Firestore.

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  /// Membuat StreamController untuk mengelola aliran data.

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  /// Getter untuk mengakses aliran data.

  Future<void> addDiagnosis(DiaggejalaModel diagmodel) async {
    final diag = diagmodel.toMap();

    /// Mengonversi objek DiaggejalaModel ke bentuk Map.

    final DocumentReference docRef = await diagCollection.add(diag);

    /// Menambahkan dokumen ke koleksi 'diagnosis' dan mendapatkan referensi dokumen.

    final String docId = docRef.id;

    /// Mendapatkan ID dokumen yang baru ditambahkan.

    final DiaggejalaModel diagModel = DiaggejalaModel(
      diagid: docId,

      /// Mengatur ID diaggejala sesuai dengan ID dokumen yang baru ditambahkan.
      selectedSymptoms: diagmodel.selectedSymptoms,

      /// Mengatur gejala yang dipilih.
      diagnosisResult: diagmodel.diagnosisResult,

      /// Mengatur hasil diagnosis.
    );

    await docRef.update(diagModel.toMap());

    /// Memperbarui dokumen dengan data diaggejala yang telah diperbarui.
  }
}
