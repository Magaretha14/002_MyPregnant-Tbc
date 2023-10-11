class TbcModel {
  String? tbcid;

  /// Variabel untuk menyimpan ID TBC (opsional).
  final String hari;

  /// Variabel untuk menyimpan hari.
  final String formattgl;

  /// Variabel untuk menyimpan tanggal yang diformat.
  final String beratbadan;

  /// Variabel untuk menyimpan berat badan.
  final String keluhan;

  /// Variabel untuk menyimpan keluhan.
  final String tindakan;

  /// Variabel untuk menyimpan tindakan yang diambil.

  TbcModel({
    this.tbcid,

    /// Parameter tbcid bersifat opsional.
    required this.hari,
    required this.formattgl,
    required this.beratbadan,
    required this.keluhan,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    /// Mengonversi objek TbcModel menjadi Map.
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
    /// Membuat objek TbcModel dari Map.
    return TbcModel(
      tbcid: map['tbcid'],

      /// Mengambil nilai 'tbcid' (bisa null).
      hari: map['hari'] ?? '',

      /// Mengambil nilai 'hari' atau string kosong jika null.
      formattgl: map['formattgl'] ?? '',

      /// Mengambil nilai 'formattgl' atau string kosong jika null.
      beratbadan: map['beratbadan'] ?? '',

      /// Mengambil nilai 'beratbadan' atau string kosong jika null.
      keluhan: map['keluhan'] ?? '',

      /// Mengambil nilai 'keluhan' atau string kosong jika null.
      tindakan: map['tindakan'] ?? '',

      /// Mengambil nilai 'tindakan' atau string kosong jika null.
    );
  }

  String toJson() => json.encode(toMap());

  /// Mengonversi objek menjadi representasi JSON.

  factory TbcModel.fromJson(String source) =>
      TbcModel.fromMap(json.decode(source));

  /// Membuat objek TbcModel dari JSON.
}
