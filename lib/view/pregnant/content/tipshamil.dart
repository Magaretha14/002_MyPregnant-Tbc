import 'package:flutter/material.dart';

class TipsHamil extends StatelessWidget {
  const TipsHamil({super.key});

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
                        image: AssetImage('images/tipskehamilan.png'),
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
