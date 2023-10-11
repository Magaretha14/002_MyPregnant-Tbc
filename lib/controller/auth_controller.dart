import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mypregnant/model/user_model.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// Membuat instance FirebaseAuth.

  final CollectionReference userCollection =

      /// Mengakses koleksi 'users' di Firestore.
      FirebaseFirestore.instance.collection('users');

  bool get success => false;

  /// Getter success yang selalu mengembalikan false.

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      /// Melakukan login dengan email dan password.
      final User? user = userCredential.user;

      /// Mendapatkan objek User hasil login.

      if (user != null) {
        final DocumentSnapshot snapshot =
            await userCollection.doc(user.uid).get();

        /// Mengambil data pengguna dari Firestore.

        final UserModel currentUser = UserModel(
          Uid: user.uid,
          email: user.email ?? '',

          /// Mengambil email pengguna atau string kosong jika null.
          name: snapshot['name'] ?? '',

          /// Mengambil nama pengguna atau string kosong jika null.
        );

        return currentUser;

        /// Mengembalikan objek UserModel dari pengguna yang berhasil login.
      }
    } catch (e) {
      ///print('Error signIn user: $e');
    }

    return null;

    /// Mengembalikan null jika login gagal.
  }

  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      /// Membuat akun baru dengan email dan password.
      final User? user = userCredential.user;

      /// Mendapatkan objek User hasil registrasi.

      if (user != null) {
        final UserModel newUser =
            UserModel(Uid: user.uid, email: user.email ?? '', name: name);

        /// Membuat objek UserModel baru.

        await userCollection.doc(newUser.Uid).set(newUser.toMap());

        /// Menyimpan data pengguna ke Firestore.

        return newUser;

        /// Mengembalikan objek UserModel dari pengguna yang berhasil registrasi.
      }
    } catch (e) {
      print('Error registering user: $e');

      /// Menampilkan pesan error jika registrasi gagal.
    }

    return null;

    /// Mengembalikan null jika registrasi gagal.
  }

  UserModel? getCurrentUser() {
    final User? user = auth.currentUser;

    /// Mendapatkan pengguna saat ini.
    if (user != null) {
      return UserModel.fromFirebaseUser(user);

      /// Mengembalikan UserModel dari pengguna saat ini.
    }
    return null;

    /// Mengembalikan null jika tidak ada pengguna saat ini.
  }

  Future<void> signOut() async {
    await auth.signOut();

    /// Melakukan proses logout pengguna saat ini.
  }
}
