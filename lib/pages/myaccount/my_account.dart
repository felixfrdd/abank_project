import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abank_project/pages/myaccount/change_pin.dart';
import 'package:abank_project/pages/myaccount/view_cvv.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF363636),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Account"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [

            Container(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        image: AssetImage('images/KartuAbank.png')))),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: Image.asset(
                      'icons/lock.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const ChangePin()));
                  },
                ),

                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      'icons/cvv.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>  ViewCVV()));
                  },
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only( top: 15),
                  child: const Text(
                    "Change Pin",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only( top: 15),
                  child: const Text(
                    "View CVV",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                child: TextButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0)),
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF000000),
                      backgroundColor: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
