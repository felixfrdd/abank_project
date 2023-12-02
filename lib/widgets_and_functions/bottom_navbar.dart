import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/transfer_history/transfer_history.dart';
import '../pages/transfer/transfer_page.dart';
import '../pages/scan/qrscanner.dart';
import '../pages/myaccount/my_account.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _indexBotNav = 0;
  List<Widget> bodies = [];
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    bodies = [
      HomePage(onIndexChanged: (index) {
        setIndex(index);
      }),
      const TransferPage(),
      // const QRScanner(),
      const TransferHistoryPage(),
      const MyAccount()
    ];
  }

  void setIndex(int indexIncoming) {
    setState(() {
      _indexBotNav = indexIncoming;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRScanner(),
            ));
          },
        child: Icon(Icons.qr_code_scanner, color: Colors.black, size: 30),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Color(0xFFD9D9D9),
        
        backgroundColor: Colors.white,
        height: 70,
        selectedIndex: _indexBotNav,
        onDestinationSelected: (int indexIncoming) {
          setIndex(indexIncoming);
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz),
            label: "Transfer",
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.qr_code_scanner),
          //   label: "Scan",
          // ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(Icons.manage_accounts_outlined),
            selectedIcon: Icon(Icons.manage_accounts),
            label: "My Account",
          ),
        ],
      ),
      body: bodies[_indexBotNav],
    );
  }
}
