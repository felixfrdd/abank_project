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
        title: const Text('Bills'),
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
                _showVirtualAccountInputDialog(context, bills[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showVirtualAccountInputDialog(BuildContext context, String billType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController virtualAccountController = TextEditingController();

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Enter the virtual account number for $billType:'),
              TextField(
                controller: virtualAccountController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String virtualAccount = virtualAccountController.text;

                Navigator.pop(context);

                _showSuccessSnackbar(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Payment Successful!',
        style: TextStyle(fontSize: 16),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


