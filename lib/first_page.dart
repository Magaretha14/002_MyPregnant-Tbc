import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/controller/auth_controller.dart';
import 'package:mypregnant/view/homepage.dart';
import 'package:mypregnant/view/login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key}); // Kode ini adalah konstruktor kelas FirstPage.
  /// Namun, tampaknya ada kesalahan sintaks dalam penggunaan "super.key".
  /// Seharusnya menggunakan "Key key" sebagai parameter konstruktor.

  @override
  State<FirstPage> createState() => _FirstPageState();

  /// Ini adalah metode yang mendeklarasikan State yang terkait dengan FirstPage.
  /// Ini akan digunakan untuk mengelola keadaan widget ini.
}

class _FirstPageState extends State<FirstPage> {
  final authctrl = AuthController(); // Membuat instance AuthController.

  bool isLogin = false;

  /// Membuat variabel boolean "isLogin" dan menginisialisasikannya dengan false.

  Future<void> silentLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    /// Mendapatkan instance FirebaseAuth.
    User? user = auth.currentUser;

    /// Mendapatkan pengguna yang saat ini masuk, jika ada.

    if (user != null && user.uid != null && user.uid.isNotEmpty) {
      /// Memeriksa apakah ada pengguna yang masuk dan memiliki UID yang valid.
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      /// Mendapatkan dokumen pengguna dari Firestore berdasarkan UID.

      if (userSnapshot.exists) {
        /// Jika dokumen pengguna ada,
        setState(() {
          isLogin = true;

          /// Set "isLogin" menjadi true, menunjukkan bahwa pengguna sudah masuk.
        });
      }
    }
  }

  int currentIndex = 0;

  /// Mendeklarasikan variabel "currentIndex" dengan nilai awal 0.
  void onTap(int index) {
    setState(() {
      currentIndex = index;

      /// Mengubah nilai "currentIndex" sesuai dengan indeks yang diklik.
    });
  }

  @override
  void initState() {
    /// Metode ini dipanggil ketika widget diinisialisasi.
    super.initState();

    /// Memanggil metode initState dari superclass.
    authctrl.getCurrentUser();

    /// Memanggil metode untuk mendapatkan pengguna saat ini.
    silentLogin();

    /// Memanggil metode silentLogin untuk memeriksa masuknya pengguna.
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      return HomePage();

      /// Mengembalikan widget HomePage jika pengguna sudah masuk.
    } else {
      return LoginPage();

      /// Mengembalikan widget LoginPage jika pengguna belum masuk.
    }
  }
}
