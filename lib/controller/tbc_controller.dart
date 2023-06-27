import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/tbc_model.dart';

class TbcController {
  final tbcCollection = FirebaseFirestore.instance.collection('tubercolosis');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addTbc(TbcModel tbcmodel) async {
    final tbc = tbcmodel.toMap();

    final DocumentReference docRef = await tbcCollection.add(tbc);

    final String docId = docRef.id;

    final TbcModel tbcModel = TbcModel(
        tbcid: docId,
        hari: tbcmodel.hari,
        datetime: tbcmodel.datetime,
        beratbadan: tbcmodel.beratbadan,
        keluhan: tbcmodel.keluhan,
        tindakan: tbcmodel.tindakan);

    await docRef.update(tbcModel.toMap());
  }

  Future<void> updateTbc(TbcModel tbcmodel) async {
    final TbcModel tbcModel = TbcModel(
        tbcid: tbcmodel.tbcid,
        hari: tbcmodel.hari,
        datetime: tbcmodel.datetime,
        beratbadan: tbcmodel.beratbadan,
        keluhan: tbcmodel.keluhan,
        tindakan: tbcmodel.tindakan);

    await tbcCollection.doc(tbcmodel.tbcid).update(tbcModel.toMap());
  }

  Future<void> removeTbc(String id) async {
    await tbcCollection.doc(id).delete();
    await getTbc();
  }

  Future getTbc() async {
    final tbc = await tbcCollection.get();
    streamController.add(tbc.docs);
    return tbc.docs;
  }
}
