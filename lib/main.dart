import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TransferItem extends StatelessWidget {
  final String date;
  final String name;
  final String currency;

  const TransferItem({
    required this.date,
    required this.name,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            currency,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 103, 220, 57),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navbar dengan Gambar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1 // Only show app bar for the "Transfer" page
          ? AppBar(
              backgroundColor: const Color(0xFF363636),
              title: Image.asset(
                'assets/ABank.png',
                height: AppBar().preferredSize.height,
              ),
              centerTitle: true,
            )
          : null, // Hide app bar for other pages
      body: Container(
        color: Colors.grey[200],
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _getPage(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.6),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Error'));

      case 1:
        return Column(
          children: [
            const Text(
              'Transfer History',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.black),
                  bottom: BorderSide(width: 2.0, color: Colors.black),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                children: [
                  TransferItem(
                    date: '2023-11-10',
                    name: 'John tony',
                    currency: 'RP 7.000.000',
                  ),
                  TransferItem(
                    date: '2023-11-09',
                    name: 'Justin bibir',
                    currency: 'RP 8.000.000',
                  ),
                ],
              ),
            ),
          ),
        ],
      );

      case 2:
        return const Center(child: Text('Error'));

      case 3:
        return const Center(child: Text('Error'));

      default:
        return Container();
    }
  }
}