import 'package:flutter/material.dart';
import 'pages//home_page.dart';
import 'pages/transfer/transfer_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF363636),
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Colors.grey,
            selectionHandleColor: Color.fromARGB(255, 123, 122, 122),
            cursorColor: Colors.grey,
          )),
      home: const MainFunction(),
    ),
  );
}

class MainFunction extends StatefulWidget {
  const MainFunction({Key? key}) : super(key: key);

  @override
  State<MainFunction> createState() => _MainFunctionState();
}

class _MainFunctionState extends State<MainFunction> {
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
