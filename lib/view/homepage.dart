import 'package:flutter/material.dart';
import 'package:mypregnant/components/bottomnavbar.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/view/home_pregnant.dart';
import 'package:mypregnant/view/home_tbc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: PageView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.pink,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/tipspreg.png'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/tbc.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePregnant()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/iconhamil.png',
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeTbc()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 108, 201, 244),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/icontbc.png',
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
