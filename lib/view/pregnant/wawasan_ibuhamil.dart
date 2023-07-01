import 'package:flutter/material.dart';

class WawasanPregnant extends StatefulWidget {
  const WawasanPregnant({super.key});

  @override
  State<WawasanPregnant> createState() => _WawasanPregnantState();
}

class _WawasanPregnantState extends State<WawasanPregnant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePregnant()),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 179, 239),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        'images/tipskehamilanbutton.png',
                        height: 100,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeTbc()),
                    // );
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
