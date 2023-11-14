import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter NavBar',
      home: Tutorial(),
      debugShowCheckedModeBanner: false
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
  bool isCardNumberVisible = true;
  bool isBalanceVisible = true;
  String accountName = "Adrian Muhalim";
  List<Widget> bodies = const [];

  @override
  Widget build(BuildContext context) {
    String cardNumber = isCardNumberVisible
        ? "* * * * * * * * * * * * * * * *"
        : "1234 1234 1234 1234";
    String showbalance = isBalanceVisible
        ? "* * * * * * * * * * * * * * * *"
        : "132, 312, 341, 512.00";

    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexBotNav,
        onDestinationSelected: (int index) {
          setState(() {
            indexBotNav = index;
          });
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
      body: <Widget>[
        Column(
          children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    width: 360,
                    height: 130,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Welcome Back,",
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                          ),
                          Text(
                            accountName,
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ]),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 360,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF4B4B4B),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Balance :",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Row(
                        children: [
                          Text(
                            showbalance,
                            style: const TextStyle(
                              color: Colors.amberAccent,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          InkWell(
                            //Function tunjukin uang
                            onTap: () {
                              setState(() {
                                isBalanceVisible = !isBalanceVisible;
                              });
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 2),
                        child: Text(
                          "Account Number",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            cardNumber,
                            style: const TextStyle(
                              color: Colors.amberAccent,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          InkWell(
                            //Function tunjukin uang
                            onTap: () {
                              setState(() {
                                isCardNumberVisible = !isCardNumberVisible;
                              });
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B4B4B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 60,
                          ),
                          Text("Transfer")
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 60,
                          ),
                          Text("Bill")
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 60,
                          ),
                          Text("Top Up")
                        ],
                      )),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 60,
                          ),
                          Text("E-Money")
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 60,
                          ),
                          Text("Invest")
                        ],
                      )),
                ),
                const SizedBox(
                  width: 100,
                  height: 100,
                ),
              ],
            )
          ],
        ),
        Container(
            // Containernya bisa ganti widget apa aja, Taru Code sini ei <Transfer>

            ),
        Container(
            // Containernya bisa ganti widget apa aja, Taru Code sini ei <Scan>
            ),
        Container(
            // Containernya bisa ganti widget apa aja, Taru Code sini ei <History>
            ),
        Container(
            // Containernya bisa ganti widget apa aja, Taru Code sini ei <My Account>
            ),
      ][indexBotNav],
    );
  }
}
