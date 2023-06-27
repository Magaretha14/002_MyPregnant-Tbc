import 'package:flutter/material.dart';
import 'package:mypregnant/view/tbc/add_tbc.dart';

AppBar headerdetail(context,
    {bool isTitle = false, required String titleText}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isTitle ? "My Pregnant & Tbc" : titleText,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 152, 100, 161),
  );
}
