import 'package:abank_project/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

Widget buildBackButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    splashRadius: 20.0,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
