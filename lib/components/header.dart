import 'package:flutter/material.dart';

AppBar header(context) {
  return AppBar(
    title: const Text(
      'My Pregnant & Tbc',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
  );
}
