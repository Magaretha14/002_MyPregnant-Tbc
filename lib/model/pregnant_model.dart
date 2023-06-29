import 'dart:convert';

class PregnantModel {
  String? pregid;
  final String usiajanin;
  final String formatDate;
  final String bbpreg;
  final String selectedvalue;
  final String keluhan;
  final String tindakan;
  PregnantModel({
    this.pregid,
    required this.usiajanin,
    required this.formatDate,
    required this.bbpreg,
    required this.selectedvalue,
    required this.keluhan,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    return {
      'pregid': pregid,
      'usiajanin': usiajanin,
      'formatDate': formatDate,
      'bbpreg': bbpreg,
      'selectedvalue': selectedvalue,
      'keluhan': keluhan,
      'tindakan': tindakan,
    };
  }

  factory PregnantModel.fromMap(Map<String, dynamic> map) {
    return PregnantModel(
      pregid: map['pregid'],
      usiajanin: map['usiajanin'] ?? '',
      formatDate: map['formatDate'],
      bbpreg: map['bbpreg'] ?? '',
      selectedvalue: map['selectedvalue'] ?? '',
      keluhan: map['keluhan'] ?? '',
      tindakan: map['tindakan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PregnantModel.fromJson(String source) =>
      PregnantModel.fromMap(json.decode(source));
}
