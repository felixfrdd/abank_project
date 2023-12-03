import 'package:abank_project/firebase/firestore_user_bank_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'transfer_account_page.dart';
import 'new_account_page.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  List<Map<String, String>> _allCustomer = [];
  List<Map<String, String>> _foundCustomer = [];
  final _accountListSearch = TextEditingController();
  final FirestoreUserNewBankAccount _firestoreUserNewBankAccount =
      FirestoreUserNewBankAccount();

  @override
  void initState() {
    super.initState();
    fetchData();
    _allCustomer.sort(
        (a, b) => a["fullName"].toString().compareTo(b["fullName"].toString()));
    _foundCustomer = List<Map<String, String>>.from(_allCustomer);
  }

  Future<void> fetchData() async {
    List<Map<String, String>> userData = await _firestoreUserNewBankAccount
        .getAddedAccount(FirebaseAuth.instance.currentUser!.email!);
    setState(() {
      _allCustomer = userData;
      _allCustomer.sort((a, b) => a["fullName"]
          .toString()
          .toLowerCase()
          .compareTo(b["fullName"].toString().toLowerCase()));
      _foundCustomer = List<Map<String, String>>.from(_allCustomer);
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allCustomer;
    } else {
      results = _allCustomer
          .where((customer) =>
              customer['fullName']
                  .toString()
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase().toString()) ||
              customer['accNum'].toString().contains(enteredKeyword.toString()))
          .toList();
    }
    setState(() {
      _foundCustomer = results;
    });
  }

  @override
  void dispose() {
    _accountListSearch.dispose();
    super.dispose();
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
                          builder: (context) =>
                              NewAccountPage(fetchData: fetchData),
                        ),
                      );
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
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 56, 56, 56)),
                        borderRadius: BorderRadius.circular(50),
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
                                _foundCustomer[index]['fullName'].toString(),
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Text(
                                  _foundCustomer[index]["accNum"].toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 16.0,
                                  )),
                              onTap: () {
                                String customerName = _foundCustomer[index]
                                        ["fullName"]
                                    .toString();
                                String accNum =
                                    _foundCustomer[index]["accNum"].toString();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TransferAccountPage(
                                          customerName: customerName,
                                          accNum: accNum),
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
