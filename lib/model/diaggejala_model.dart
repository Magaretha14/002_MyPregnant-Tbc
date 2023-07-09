import 'dart:convert';

class DiaggejalaModel {
  String diagid;
  List<String> selectedSymptoms;
  String diagnosisResult;
  DiaggejalaModel({
    required this.diagid,
    required this.selectedSymptoms,
    required this.diagnosisResult,
  });

  Map<String, dynamic> toMap() {
    return {
      'diagid': diagid,
      'selectedSymptoms': selectedSymptoms,
      'diagnosisResult': diagnosisResult,
    };
  }

  factory DiaggejalaModel.fromMap(Map<String, dynamic> map) {
    return DiaggejalaModel(
      diagid: map['diagid'] ?? '',
      selectedSymptoms: List<String>.from(map['selectedSymptoms']),
      diagnosisResult: map['diagnosisResult'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DiaggejalaModel.fromJson(String source) =>
      DiaggejalaModel.fromMap(json.decode(source));
}
