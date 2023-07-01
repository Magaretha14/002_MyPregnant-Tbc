import 'dart:convert';

class TbcModel {
  String? tbcid;
  final String hari;
  final String formattgl;
  final String beratbadan;
  final String keluhan;
  final String tindakan;
  TbcModel({
    this.tbcid,
    required this.hari,
    required this.formattgl,
    required this.beratbadan,
    required this.keluhan,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    return {
      'tbcid': tbcid,
      'hari': hari,
      'formattgl': formattgl,
      'beratbadan': beratbadan,
      'keluhan': keluhan,
      'tindakan': tindakan,
    };
  }

  factory TbcModel.fromMap(Map<String, dynamic> map) {
    return TbcModel(
      tbcid: map['tbcid'],
      hari: map['hari'] ?? '',
      formattgl: map['formattgl'] ?? '',
      beratbadan: map['beratbadan'] ?? '',
      keluhan: map['keluhan'] ?? '',
      tindakan: map['tindakan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TbcModel.fromJson(String source) =>
      TbcModel.fromMap(json.decode(source));
}
