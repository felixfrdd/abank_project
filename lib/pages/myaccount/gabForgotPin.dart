import 'package:flutter/material.dart';

class gabForgotPin extends StatefulWidget {
  const gabForgotPin({super.key});

  @override
  State<gabForgotPin> createState() => _gabForgotPinState();
}

class _gabForgotPinState extends State<gabForgotPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363636),        
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Forgot Pin"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,   
        children: [
          Text("Enter Your Email",style: TextStyle(fontSize: 20,color: Colors.white),),
          
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child:TextField(
              decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
               ),

               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black)
               ),

               hintText: "Email",
               fillColor: Colors.grey[200],
               filled: true,

              ),
            )
          ),          

        ],     
      ),
    );
  }
}