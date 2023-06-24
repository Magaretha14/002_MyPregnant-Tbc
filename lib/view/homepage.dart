import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.purple),
                  child: const SizedBox(
                    child: Text(
                      'Page 1',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.purple),
                  child: const SizedBox(
                    child: Text(
                      'Page 2',
                      textAlign: TextAlign.center,
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 127, 229),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Image.asset(
                      'images/logomypreg.png',
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 127, 229),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Image.asset(
                      'images/logomypreg.png',
                      height: 100,
                      width: 150,
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
