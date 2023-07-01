import 'package:flutter/material.dart';
import 'package:mypregnant/view/profile.dart';

AppBar header(context, {bool isTitle = false, required String titleText}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isTitle ? "My Pregnant & Tbc" : titleText,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        )
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 152, 100, 161),
    automaticallyImplyLeading: false,
  );
}
