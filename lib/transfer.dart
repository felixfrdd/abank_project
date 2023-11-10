import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF363636)),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Center(
          child: Text(
            'Transfer',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              height: 1.5,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(top: 10.0, right: 10.0),
          child: SizedBox(
            width: 150,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                foregroundColor: const Color(0xFF000000),
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'New Account Number',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
