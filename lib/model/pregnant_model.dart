class PregnantModel {
  String? pregid;

  /// Variabel untuk menyimpan ID kehamilan (opsional).
  final String usiajanin;

  /// Variabel untuk menyimpan usia janin.
  final String formatDate;

  /// Variabel untuk menyimpan tanggal yang diformat.
  final String bbpreg;

  /// Variabel untuk menyimpan berat badan saat hamil.
  final String selectedvalue;

  /// Variabel untuk menyimpan nilai terpilih.
  final String keluhan;

  /// Variabel untuk menyimpan keluhan.
  final String tindakan;

  /// Variabel untuk menyimpan tindakan yang diambil.

  PregnantModel({
    this.pregid,

    /// Parameter pregid bersifat opsional.
    required this.usiajanin,
    required this.formatDate,
    required this.bbpreg,
    required this.selectedvalue,
    required this.keluhan,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    /// Mengonversi objek PregnantModel menjadi Map.
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
    /// Membuat objek PregnantModel dari Map.
    return PregnantModel(
      pregid: map['pregid'],

      /// Mengambil nilai 'pregid' (bisa null).
      usiajanin: map['usiajanin'] ?? '',

      /// Mengambil nilai 'usiajanin' atau string kosong jika null.
      formatDate: map['formatDate'],
      bbpreg: map['bbpreg'] ?? '',

      /// Mengambil nilai 'bbpreg' atau string kosong jika null.
      selectedvalue: map['selectedvalue'] ?? '',

      /// Mengambil nilai 'selectedvalue' atau string kosong jika null.
      keluhan: map['keluhan'] ?? '',

      /// Mengambil nilai 'keluhan' atau string kosong jika null.
      tindakan: map['tindakan'] ?? '',

      /// Mengambil nilai 'tindakan' atau string kosong jika null.
    );
  }

  String toJson() => json.encode(toMap());

  /// Mengonversi objek menjadi representasi JSON.

  factory PregnantModel.fromJson(String source) =>
      PregnantModel.fromMap(json.decode(source));

  /// Membuat objek PregnantModel dari JSON.
}
