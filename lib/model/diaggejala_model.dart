import 'dart:convert';

class DiaggejalaModel {
  String diagid;

  /// Variabel untuk menyimpan ID diagnosa.
  List<String> selectedSymptoms;

  /// Variabel untuk menyimpan gejala yang dipilih.
  String diagnosisResult;

  /// Variabel untuk menyimpan hasil diagnosis.

  DiaggejalaModel({
    required this.diagid,
    required this.selectedSymptoms,
    required this.diagnosisResult,
  });

  Map<String, dynamic> toMap() {
    /// Mengonversi objek DiaggejalaModel menjadi Map.
    return {
      'diagid': diagid,
      'selectedSymptoms': selectedSymptoms,
      'diagnosisResult': diagnosisResult,
    };
  }

  factory DiaggejalaModel.fromMap(Map<String, dynamic> map) {
    /// Membuat objek DiaggejalaModel dari Map.
    return DiaggejalaModel(
      diagid: map['diagid'] ?? '',

      /// Mengambil nilai 'diagid' atau string kosong jika null.
      selectedSymptoms: List<String>.from(map['selectedSymptoms']),
      diagnosisResult: map['diagnosisResult'] ?? '',

      /// Mengambil nilai 'diagnosisResult' atau string kosong jika null.
    );
  }

  String toJson() => json.encode(toMap());

  /// Mengonversi objek menjadi representasi JSON.

  factory DiaggejalaModel.fromJson(String source) =>
      DiaggejalaModel.fromMap(json.decode(source));

  /// Membuat objek DiaggejalaModel dari JSON.
}
