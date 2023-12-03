import 'package:flutter/material.dart';

class ewalletScreen extends StatelessWidget {
  final List<Map<String, dynamic>> ewallet = [
    {
      'name': 'DANA',
      'image': 'images/dana_logo.png',
    },
    {
      'name': 'Gopay',
      'image': 'images/gopay_logo.png',
    },
    {
      'name': 'OVO',
      'image': 'images/ovo_logo.png',
    },
    {
      'name': 'Shopeepay',
      'image': 'images/shopeepay_logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('E - Money'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: ewallet.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(64),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(
                  left: 20, right: 20, top: 17, bottom: 17),
              leading: Image.asset(
                ewallet[index]['image'],
                width: 100,
                height: 100,
              ),
              title: Text(
                ewallet[index]['name'],
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
              onTap: () {
                // aksi saat button diklik, ontoh: Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(billType: bills[index])));
              },
            ),
          );
        },
      ),
    );
  }
}
