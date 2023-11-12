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
      backgroundColor: const Color(0xFF363636),
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
            Column(children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        
                        const Text(
                          "Adrian Muhalim", 
                          style: TextStyle(
                            fontSize: 30, 
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ]),
                  ),
                ]
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, top: 30),
                margin: const EdgeInsets.only(top: 15),
                width: 360,
                height: 175,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,                   
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Text(
                      "Balance :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),),
                    
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Rp. 102,124,532,312,00",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 15
                        ),
                      ),
                    )
                    ,
                    
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 2),
                      child: Text(
                        "Account Number",
                        style: TextStyle(
                          color: Colors.white,

                        ),),
                    ),
                    
                    Row(
                      children: [
                        const Text(
                          "1234 1234 1234 1234",
                          style: TextStyle(
                            color: Colors.amberAccent,
                          ),),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        InkWell(
                          onTap: () {},
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

          ],)
          
        ,
          
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