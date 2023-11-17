import 'package:abank_project/Pages/SetALimit.dart';
import 'package:flutter/material.dart';
import 'package:abank_project/Pages/ChangePin.dart';
import 'package:abank_project/Pages/ViewCVV.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF363636),
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Account"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // Container(
            //   padding:EdgeInsets.all(15),
            //   color: Colors.white,
            //   height: 50,
            //   width: 370,
            //   child : Text(
            //     "Jenis Kartu",
            //     style: TextStyle(fontSize: 20.0),),
            // ),

            Container(
                padding: EdgeInsets.all(30.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(image: AssetImage('images/Abank (1).png')))),

            Row(
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 15),
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: Image.asset(
                      'icons/lock.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const ChangePin()));
                  },
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: Image.asset(
                      'icons/credit-limit.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const SetALimit()));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      'icons/cvv.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const ViewCVV()));
                  },
                )
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, top: 15),
                  child: Text(
                    "Change Pin",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 45, top: 15),
                  child: Text(
                    "Set a Limit",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 43, top: 15),
                  child: Text(
                    "View CVV",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
