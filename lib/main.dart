import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
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
