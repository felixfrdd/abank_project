import 'package:abank_project/pages/myaccount/my_account.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const gabMain());
}

class gabMain extends StatelessWidget {
  const gabMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyAccount(),
    );
  }
}
