import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function(int) onIndexChanged;

  const HomePage({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCardNumberVisible = true;
  bool isBalanceVisible = true;
  String accountName = "Adrian Muhalim";

  @override
  Widget build(BuildContext context) {
    String cardNumber = isCardNumberVisible
        ? "* * * * * * * * * * * * * * * *"
        : "1234 1234 1234 1234";
    String showbalance = isBalanceVisible
        ? "* * * * * * * * * * * * * * * *"
        : "132, 312, 341, 512.00";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF363636),
      body: Column(
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
                onTap: () {
                  widget.onIndexChanged(1);
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
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
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.corporate_fare,
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
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.atm,
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
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wallet_giftcard,
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
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_chart,
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
    );
  }
}
