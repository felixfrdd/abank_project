import 'package:flutter/material.dart';

class gabForgotPin extends StatefulWidget {
  const gabForgotPin({super.key});

  @override
  State<gabForgotPin> createState() => _gabForgotPinState();
}

class _gabForgotPinState extends State<gabForgotPin> {
  final _gabChangePinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),        
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Forgot Pin"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,   
        children: [
          const Text("Enter Your Email",style: TextStyle(fontSize: 20,color: Colors.white),),
          
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:TextField(
              controller: _gabChangePinController,
              decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
               ),

               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const  BorderSide(color: Colors.black)
               ),

               hintText: "Email",
               fillColor: Colors.grey[200],
               filled: true,

              ),
            )
          ),          

            const SizedBox(height: 15,),
            MaterialButton(
              onPressed: (){

              },
              child: const Text("Reset Pin",
              style: TextStyle(fontSize: 20,color:Colors.black),
              ),
              color:const Color.fromARGB(255, 70, 172, 254),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 1,color: Colors.black)
              ),
              padding: const EdgeInsets.only(top: 10,bottom: 10,right: 35,left: 35),
            )
        ],     
      ),
    );
  }
}