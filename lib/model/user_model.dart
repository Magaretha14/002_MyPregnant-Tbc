import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String name;

  /// Variabel untuk menyimpan nama pengguna.
  String email;

  /// Variabel untuk menyimpan alamat email pengguna.
  String Uid;

  /// Variabel untuk menyimpan ID pengguna.

  UserModel({
    required this.name,
    required this.email,
    required this.Uid,
  });

  Map<String, dynamic> toMap() {
    /// Mengonversi objek UserModel menjadi Map.
    return {
      'name': name,
      'email': email,
      'Uid': Uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    /// Membuat objek UserModel dari Map.
    return UserModel(
      name: map['name'] ?? '',

      /// Mengambil nilai 'name' atau string kosong jika null.
      email: map['email'] ?? '',

      /// Mengambil nilai 'email' atau string kosong jika null.
      Uid: map['Uid'] ?? '',

      /// Mengambil nilai 'Uid' atau string kosong jika null.
    );
  }

  String toJson() => json.encode(toMap());

  /// Mengonversi objek menjadi representasi JSON.

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  /// Membuat objek UserModel dari JSON.

  UserModel copyWith({
    String? name,
    String? email,
    String? Uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      Uid: Uid ?? this.Uid,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, email: $email, Uid: $Uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.Uid == Uid;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ Uid.hashCode;

  static UserModel? fromFirebaseUser(User user) {
    /// Metode untuk membuat objek UserModel dari objek Firebase User.
    if (user != null) {
      return UserModel(
        name: user.displayName ?? '',

        /// Mengambil nama pengguna atau string kosong jika null.
        email: user.email ?? '',

        /// Mengambil alamat email atau string kosong jika null.
        Uid: user.uid ?? '',

        /// Mengambil ID pengguna atau string kosong jika null.
      );
    }
    return null;
  }
}
