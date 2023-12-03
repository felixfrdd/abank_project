import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:abank_project/pages/myaccount/my_account.dart';

class ViewCVV extends StatefulWidget {
  
  ViewCVV({Key? key});

  @override
  State<ViewCVV> createState() => _ViewCVVState();
}

class _ViewCVVState extends State<ViewCVV> {
  final FirebaseFirestore gabFireCollection = FirebaseFirestore.instance;
  String cvvText1 = "";
  Future<void>takeCVV() async{
    String cvvText =  await gabGenerateCVV();
    setState(() {
      cvvText1 = cvvText;
      
    });
  }

  @override
  void initState(){
    super.initState();
    takeCVV();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: const Color(0xFF363636),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("View CVV"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 230,
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'icons/cvv.png',
                            height: 140,
                            width: 140,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'CVV',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color(0xFFD9D9D9),
                  height: 60,
                  width: 300,
                  child: Text(
                    cvvText1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    Future gabGenerateCVV() async{
    String insertMail = FirebaseAuth.instance.currentUser!.email!;
    final gabDocUser = FirebaseFirestore.instance.collection('user_form').doc(insertMail.toString());
    QuerySnapshot cekCVV = await gabFireCollection.collection('user_form').where('email',isEqualTo: insertMail.toString() ).get();

    String ambilCVV = cekCVV.docs[0]['CVV'];
    return ambilCVV;
  }
}
