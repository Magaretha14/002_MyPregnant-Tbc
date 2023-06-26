import 'dart:convert';

import 'package:flutter/material.dart';

class TbcModel {
  String? tbcid;
  final String hari;
  final DateTime? datetime;
  final String beratbadan;
  final String keluhan;
  final String tindakan;
  TbcModel({
    this.tbcid,
    required this.hari,
    this.datetime,
    required this.beratbadan,
    required this.keluhan,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    return {
      'tbcid': tbcid,
      'hari': hari,
      'datetime': datetime?.toString(),
      'beratbadan': beratbadan,
      'keluhan': keluhan,
      'tindakan': tindakan,
    };
  }

  factory TbcModel.fromMap(Map<String, dynamic> map) {
    return TbcModel(
      tbcid: map['tbcid'],
      hari: map['hari'] ?? '',
      datetime: map['datetime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['datetime'])
          : null,
      beratbadan: map['beratbadan'] ?? '',
      keluhan: map['keluhan'] ?? '',
      tindakan: map['tindakan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TbcModel.fromJson(String source) =>
      TbcModel.fromMap(json.decode(source));
}
