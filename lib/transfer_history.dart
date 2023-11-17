import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TransferItemContainer extends StatelessWidget {
  final Widget child;

  const TransferItemContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 150,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final String date;
  final String name;
  final String currency;

  const TransferItem({super.key, 
    required this.date,
    required this.name,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return TransferItemContainer(
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Rp',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 103, 220, 57),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currency,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 103, 220, 57),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ',00',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 103, 220, 57),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransferHistory {
  final String date;
  final String name;
  final String currency;

  TransferHistory({
    required this.date,
    required this.name,
    required this.currency,
  });
}

List<TransferHistory> transferHistories = [
  TransferHistory(
    date: '2023-11-10',
    name: 'John Tony',
    currency: '7.000.000',
  ),
  TransferHistory(
    date: '2023-11-09',
    name: 'Justin Bibir',
    currency: '8.000.000',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History',
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
      appBar: _selectedIndex == 1
          ? AppBar(
              backgroundColor: const Color(0xFF363636),
              title: Image.asset(
                'assets/ABank.png',
                height: AppBar().preferredSize.height,
              ),
              centerTitle: true,
            )
          : null,
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
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                itemCount: transferHistories.length,
                itemBuilder: (context, index) {
                  TransferHistory transfer = transferHistories[index];
                  return TransferItemContainer(
                    child: TransferItem(
                      date: transfer.date,
                      name: transfer.name,
                      currency: transfer.currency,
                    ),
                  );
                },
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