import 'package:flutter/material.dart';

class TipsKerja extends StatefulWidget {
  const TipsKerja({super.key});

  @override
  State<TipsKerja> createState() => _TipsKerjaState();
}

class _TipsKerjaState extends State<TipsKerja> {
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
                      color: Colors.pink,
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/tipskerjasaathamidun.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('isi tips kehamilan')
          ],
        ),
      ),
    );
  }
}
