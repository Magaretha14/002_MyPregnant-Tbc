import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/first_page.dart';
import 'package:mypregnant/view/homepage.dart';
import 'package:mypregnant/view/pregnant/wawasan_ibuhamil.dart';

Future main() async {
  /// Pastikan Flutter Widgets sudah terinisialisasi.
  WidgetsFlutterBinding.ensureInitialized();

  /// Inisialisasi Firebase.
  await Firebase.initializeApp();

  /// Jalankan aplikasi Flutter.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///Mengarahkan ke halaman pertama
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}
