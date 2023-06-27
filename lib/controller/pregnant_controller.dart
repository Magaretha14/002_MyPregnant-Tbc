import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypregnant/model/pregnant_model.dart';

class PregnantController {
  final pregCollection = FirebaseFirestore.instance.collection('pregnants');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addPregnant(PregnantModel pregmodel) async {
    final preg = pregmodel.toMap();

    final DocumentReference docRef = await pregCollection.add(preg);

    final String docId = docRef.id;

    final PregnantModel pregModel = PregnantModel(
        pregid: docId,
        usiajanin: pregmodel.usiajanin,
        tanggal: pregmodel.tanggal,
        bbpreg: pregmodel.bbpreg,
        selectedvalue: pregmodel.selectedvalue,
        keluhan: pregmodel.keluhan,
        tindakan: pregmodel.tindakan);

    await docRef.update(pregModel.toMap());
  }

  // Future<void> updateTbc(TbcModel tbcmodel) async {
  //   final TbcModel tbcModel = TbcModel(
  //       tbcid: tbcmodel.tbcid,
  //       hari: tbcmodel.hari,
  //       datetime: tbcmodel.datetime,
  //       beratbadan: tbcmodel.beratbadan,
  //       keluhan: tbcmodel.keluhan,
  //       tindakan: tbcmodel.tindakan);

  //   await tbcCollection.doc(tbcmodel.tbcid).update(tbcModel.toMap());
  // }

  // Future<void> detailTbc(TbcModel tbcmodel) async {
  //   final TbcModel tbcModel = TbcModel(
  //       tbcid: tbcmodel.tbcid,
  //       hari: tbcmodel.hari,
  //       datetime: tbcmodel.datetime,
  //       beratbadan: tbcmodel.beratbadan,
  //       keluhan: tbcmodel.keluhan,
  //       tindakan: tbcmodel.tindakan);

  //   await tbcCollection.doc(tbcmodel.tbcid).update(tbcModel.toMap());
  // }

  Future<void> removePreg(String id) async {
    await pregCollection.doc(id).delete();
    await getPreg();
  }

  Future getPreg() async {
    final preg = await pregCollection.get();
    streamController.add(preg.docs);
    return preg.docs;
  }
}
