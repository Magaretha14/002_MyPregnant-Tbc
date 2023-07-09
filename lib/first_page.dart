import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/controller/auth_controller.dart';
import 'package:mypregnant/view/homepage.dart';
import 'package:mypregnant/view/login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final authctrl = AuthController();
  bool isLogin = false;

  Future<void> silentLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null && user.uid != null && user.uid.isNotEmpty) {
      DocumentSnapshot<Map<String, dynamic>> userSnaphot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      if (userSnaphot.exists) {
        setState(() {
          isLogin = true;
        });
      }
    }
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authctrl.getCurrentUser();
    silentLogin();
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
