import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/tbc_model.dart';

class TbcController {
  final tbcCollection = FirebaseFirestore.instance.collection('tubercolosiss');

  /// Mengakses koleksi 'tubercolosiss' di Firestore.

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  /// Membuat StreamController untuk mengelola aliran data.

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  /// Getter untuk mengakses aliran data.

  Future<void> addTbc(TbcModel tbcmodel) async {
    final tbc = tbcmodel.toMap();

    /// Mengonversi objek TbcModel ke bentuk Map.

    final DocumentReference docRef = await tbcCollection.add(tbc);

    /// Menambahkan dokumen ke koleksi 'tubercolosiss' dan mendapatkan referensi dokumen.

    final String docId = docRef.id;

    /// Mendapatkan ID dokumen yang baru ditambahkan.

    final TbcModel tbcModel = TbcModel(
      tbcid: docId,

      /// Mengatur ID TBC sesuai dengan ID dokumen yang baru ditambahkan.
      hari: tbcmodel.hari,
      formattgl: tbcmodel.formattgl,
      beratbadan: tbcmodel.beratbadan,
      keluhan: tbcmodel.keluhan,
      tindakan: tbcmodel.tindakan,
    );

    await docRef.update(tbcModel.toMap());

    /// Memperbarui dokumen dengan data TBC yang telah diperbarui.
  }

  Future<void> updateTbc(TbcModel tbcmodel) async {
    final TbcModel tbcModel = TbcModel(
      tbcid: tbcmodel.tbcid,
      hari: tbcmodel.hari,
      formattgl: tbcmodel.formattgl,
      beratbadan: tbcmodel.beratbadan,
      keluhan: tbcmodel.keluhan,
      tindakan: tbcmodel.tindakan,
    );

    await tbcCollection.doc(tbcmodel.tbcid).update(tbcModel.toMap());

    /// Memperbarui detail dokumen TBC berdasarkan ID.
  }

  Future<void> detailTbc(TbcModel tbcmodel) async {
    final TbcModel tbcModel = TbcModel(
      tbcid: tbcmodel.tbcid,
      hari: tbcmodel.hari,
      formattgl: tbcmodel.formattgl,
      beratbadan: tbcmodel.beratbadan,
      keluhan: tbcmodel.keluhan,
      tindakan: tbcmodel.tindakan,
    );

    await tbcCollection.doc(tbcmodel.tbcid).update(tbcModel.toMap());

    /// Memperbarui detail dokumen TBC berdasarkan ID.
  }

  Future<void> removeTbc(String id) async {
    await tbcCollection.doc(id).delete();

    /// Menghapus dokumen TBC berdasarkan ID.
    await getTbc();

    /// Memperbarui data setelah penghapusan dokumen.
  }

  Future getTbc() async {
    final tbc = await tbcCollection.get();

    /// Mendapatkan data TBC dari Firestore.
    streamController.add(tbc.docs);

    /// Mengirim data ke aliran data.
    return tbc.docs;

    /// Mengembalikan dokumen-dokumen TBC.
  }
}
