import 'package:flutter/material.dart';
import 'package:abank_project/Pages/MyAccount.dart';

class ViewCVV extends StatelessWidget {
  const ViewCVV({Key? key});

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAccount(),
                ),
              );
            },
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 90),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 230,
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/icons/cvv.png',
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
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'CVV',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
                  Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xFFD9D9D9),
                  height: 60,
                  width: 300,
                  child: Text(
                    '167', textAlign: TextAlign.center,
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
}
