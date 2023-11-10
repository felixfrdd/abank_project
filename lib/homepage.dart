import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter NavBar',
      home: Tutorial(),
    ),
  );
}

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Tutorial> {
  int indexBotNav = 0;
  List<Widget> bodies = const [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABank"),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexBotNav,
        onDestinationSelected: (int index){
          setState(() {
            indexBotNav = index;
          });
        },
        destinations: const<Widget>[
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
            label: "",
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
        body: <Widget>[
          OverflowBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.no_transfer,
                    size: 50,),
                    Text("Transfer"),
                  ]),
                
                onPressed: () {},),
                
              TextButton(child: const Text("Bill"), onPressed: () {}),
              TextButton(child: const Text("Top Up"), onPressed: () {}),
            ],
          ),
          Container(
            // Taru Code sini ei

          ),
          Container(
            // Taru Code sini ei
          ),
          Container(
            // Taru Code sini ei
          ),
          Container(
            // Taru Code sini ei
          ),

        ][indexBotNav],
    );
  }
}