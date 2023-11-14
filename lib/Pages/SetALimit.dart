import 'package:flutter/material.dart';
import 'package:abank_project/Pages/MyAccount.dart';

class SetALimit extends StatelessWidget {
  const SetALimit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF363636),        
        resizeToAvoidBottomInset: false,  
        appBar: AppBar(
          centerTitle: true,
          title: Text("Set A Limit"),
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