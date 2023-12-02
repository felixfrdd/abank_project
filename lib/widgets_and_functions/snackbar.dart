import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      errorMessage,
      style: const TextStyle(fontSize: 17, color: Colors.white),
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 2),
  ));
}

void showNeutralSnackBar(BuildContext context, errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      errorMessage,
      style: const TextStyle(fontSize: 17, color: Colors.black),
    ),
    backgroundColor: const Color(0xFFD9D9D9),
    duration: const Duration(seconds: 2),
  ));
}
