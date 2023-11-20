import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/transfer/transfer_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _indexBotNav = 0;
  List<Widget> bodies = [];

  @override
  void initState() {
    super.initState();
    bodies = [
      HomePage(onIndexChanged: (index) {
        setIndex(index);
      }),
      const TransferPage(),
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
      bottomNavigationBar: NavigationBar(
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
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner),
            label: "Scan",
          ),
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
