import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/pregnant_model.dart';

class PregnantController {
  final pregCollection = FirebaseFirestore.instance.collection('pregnants');

  /// Mengakses koleksi 'pregnants' di Firestore.

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  /// Membuat StreamController untuk mengelola aliran data.

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  /// Getter untuk mengakses aliran data.

  Future<void> addPregnant(PregnantModel pregmodel) async {
    final preg = pregmodel.toMap();

    /// Mengonversi objek PregnantModel ke bentuk Map.

    final DocumentReference docRef = await pregCollection.add(preg);

    /// Menambahkan dokumen ke koleksi 'pregnants' dan mendapatkan referensi dokumen.

    final String docId = docRef.id;

    /// Mendapatkan ID dokumen yang baru ditambahkan.

    final PregnantModel pregModel = PregnantModel(
      pregid: docId,

      /// Mengatur ID kehamilan sesuai dengan ID dokumen yang baru ditambahkan.
      usiajanin: pregmodel.usiajanin,
      formatDate: pregmodel.formatDate,
      bbpreg: pregmodel.bbpreg,
      selectedvalue: pregmodel.selectedvalue,
      keluhan: pregmodel.keluhan,
      tindakan: pregmodel.tindakan,
    );

    await docRef.update(pregModel.toMap());

    /// Memperbarui dokumen dengan data kehamilan yang telah diperbarui.
  }

  Future<void> updatePreg(PregnantModel pregmodel) async {
    final PregnantModel pregModel = PregnantModel(
      pregid: pregmodel.pregid,
      usiajanin: pregmodel.usiajanin,
      formatDate: pregmodel.formatDate,
      bbpreg: pregmodel.bbpreg,
      selectedvalue: pregmodel.selectedvalue,
      keluhan: pregmodel.keluhan,
      tindakan: pregmodel.tindakan,
    );

    await pregCollection.doc(pregmodel.pregid).update(pregModel.toMap());

    /// Memperbarui dokumen kehamilan berdasarkan ID.
  }

  Future<void> detailPreg(PregnantModel pregmodel) async {
    final PregnantModel pregModel = PregnantModel(
      pregid: pregmodel.pregid,
      usiajanin: pregmodel.usiajanin,
      formatDate: pregmodel.formatDate,
      bbpreg: pregmodel.bbpreg,
      selectedvalue: pregmodel.selectedvalue,
      keluhan: pregmodel.keluhan,
      tindakan: pregmodel.tindakan,
    );

    await pregCollection.doc(pregmodel.pregid).update(pregModel.toMap());

    /// Memperbarui detail dokumen kehamilan berdasarkan ID.
  }

  Future<void> removePreg(String id) async {
    await pregCollection.doc(id).delete();

    /// Menghapus dokumen kehamilan berdasarkan ID.
    await getPreg();

    /// Memperbarui data setelah penghapusan dokumen.
  }

  Future getPreg() async {
    final preg = await pregCollection.get();

    /// Mendapatkan data kehamilan dari Firestore.
    streamController.add(preg.docs);

    /// Mengirim data ke aliran data.
    return preg.docs;

    /// Mengembalikan dokumen-dokumen kehamilan.
  }
}
