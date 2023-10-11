import 'package:flutter/material.dart';
import 'package:mypregnant/view/homepage.dart';
import 'package:mypregnant/view/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    /// TODO: implement initState
    super.initState();

    /// Delay selama 4 detik sebelum pindah ke halaman LoginPage.
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  ///Menampilkan logo splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/logomypreg.png')],
        ),
      )),
    );
  }
}
