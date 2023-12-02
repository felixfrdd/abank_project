import 'package:flutter/material.dart';
import 'transfer_account_page.dart';
import 'new_account_page.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final List<Map<String, String>> _allCustomer = [
    {'name': 'Andri', 'acc': '0927831945'},
    {'name': 'Doni', 'acc': '027398432'},
    {'name': 'Cherry', 'acc': '0867923412'},
    {'name': 'Bonny', 'acc': '0683452379'},
    {'name': 'Rani', 'acc': '0673321278'},
    {'name': 'Robin', 'acc': '0345328120'},
  ];
  List<Map<String, String>> _foundCustomer = [];
  final _accountListSearch = TextEditingController();

  @override
  void initState() {
    _allCustomer
        .sort((a, b) => a["name"].toString().compareTo(b["name"].toString()));
    _foundCustomer = _allCustomer;
    super.initState();
  }

  @override
  void dispose() {
    _accountListSearch.dispose();
    super.dispose();
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
      backgroundColor: const Color(0xFF363636),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  child: TextButton.icon(
                    icon: const Icon(Icons.group_add_sharp),
                    label: const Text('New Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0)),
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF000000),
                        backgroundColor: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewAccountPage(),
                          ));
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  TextFormField(
                    controller: _accountListSearch,
                    onChanged: (value) => _runFilter(value),
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFF000000),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      hintText: 'Search',
                      isCollapsed: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30.0,
                        color: Color(0xFF000000),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: const Color(0xFF4B4B4B),
                        splashColor: Colors.transparent,
                        splashRadius: 20.0,
                        onPressed: () {
                          _accountListSearch.clear();
                          _runFilter('');
                        },
                      ),
                      contentPadding: const EdgeInsets.all(10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                flex: 12,
                child: SizedBox(
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
                              subtitle:
                                  Text(_foundCustomer[index]["acc"].toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0,
                                      )),
                              onTap: () {
                                String customerName =
                                    _foundCustomer[index]["name"].toString();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TransferAccountPage(
                                          allCustomer: _allCustomer),
                                    ));
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ]),
      ),
    );
  }
}
