import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF363636)),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Map<String, String>> _allCustomer = [
    {'name': 'Andri', 'acc': '0927831945'},
    {'name': 'Doni', 'acc': '027398432'},
    {'name': 'Cherry', 'acc': '0867923412'},
    {'name': 'Bonny', 'acc': '0683452379'},
    {'name': 'Rani', 'acc': '06733212784'},
    {'name': 'Robin', 'acc': '0345328120'},
  ];

  List<Map<String, String>> _foundCustomer = [];
  @override
  initState() {
    _allCustomer
        .sort((a, b) => a["name"].toString().compareTo(b["name"].toString()));
    _foundCustomer = _allCustomer;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allCustomer;
    } else {
      results = _allCustomer
          .where((customer) =>
              customer['name']
                  .toString()
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase().toString()) ||
              customer['acc'].toString().contains(enteredKeyword.toString()))
          .toList();
    }
    setState(() {
      _foundCustomer = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          const Center(
            child: Text(
              'Transfer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                height: 1.5,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(
              top: 10.0,
              right: 10.0,
            ),
            child: SizedBox(
              width: 135.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  foregroundColor: const Color(0xFF000000),
                  textStyle: const TextStyle(fontSize: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'New Account Number',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextField(
                onChanged: (value) => _runFilter(value),
                autofocus: false,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF000000),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.all(10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 500,
            width: 380,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFF4B4B4B),
              ),
              child: Column(children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Account List',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _foundCustomer.length,
                    itemBuilder: (context, index) => Card(
                      color: const Color(0xFFD9D9D9),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          _foundCustomer[index]['name'].toString(),
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(_foundCustomer[index]["acc"].toString(),
                            style: const TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 16.0,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
