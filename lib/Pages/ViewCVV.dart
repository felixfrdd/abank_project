import 'package:flutter/material.dart';
import 'package:abank_project/Pages/MyAccount.dart';

class ViewCVV extends StatelessWidget {
  const ViewCVV({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF363636),
        resizeToAvoidBottomInset: false,  
        appBar: AppBar(
          centerTitle: true,
          title: Text("View CVV"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context) => MyAccount(),
                ),
              );
            },
          ),
        ),

       ),
      );
  }
}