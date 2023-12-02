import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  final List<String> bills = [
    'Credit Card',
    'Phone',
    'BPJS',
    'Tax',
    'Insurance',
    'Internet',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Bills'),
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
        itemCount: bills.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                bills[index],
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
