import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

void main() {
  runApp(const MainApp());
}

Future<void> _showAddedNewAccountDialog(
    BuildContext context, String title, String text) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        backgroundColor: const Color(0xFFD9D9D9),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF000000),
            ),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF363636),
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Colors.grey,
              selectionHandleColor: Color.fromARGB(255, 123, 122, 122),
              cursorColor: Colors.grey,
            )),
        home: const ListPage());
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Map<String, String>> _allCustomer = [
    {'name': 'Andri', 'acc': '0927831945'},
    {'name': 'Doni', 'acc': '027398432'},
    {'name': 'Cherry', 'acc': '0867923412'},
    {'name': 'Bonny', 'acc': '0683452379'},
    {'name': 'Rani', 'acc': '0673321278'},
    {'name': 'Robin', 'acc': '0345328120'},
  ];
  List<Map<String, String>> _foundCustomer = [];
  final _textEditingController = TextEditingController();

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
                  TextField(
                    controller: _textEditingController,
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
                          _textEditingController.clear();
                          _runFilter('');
                        },
                      ),
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
            ]),
      ),
    );
  }
}

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final _textEditingController = TextEditingController();
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('New Account'),
        leading: buildBackButton(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                controller: _textEditingController,
                autofocus: false,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF000000),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  hintText: 'Account Number',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: const Color(0xFF4B4B4B),
                    splashColor: Colors.transparent,
                    splashRadius: 20.0,
                    onPressed: () {
                      _textEditingController.clear();
                      setState(() {
                        enteredText = '';
                      });
                    },
                  ),
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
                onChanged: (text) {
                  setState(() {
                    enteredText = text;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              if (enteredText.length < 10)
                const Text(
                  'Minimum 10 digits',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
            ]),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 15.0),
            child: SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20.0),
                    foregroundColor: const Color(0xFF000000),
                    backgroundColor: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                onPressed: enteredText.length >= 10
                    ? () {
                        _showAddedNewAccountDialog(
                            context, 'Added', 'Account added to Account List');
                        _textEditingController.clear();
                        setState(() {
                          enteredText = '';
                        });
                      }
                    : null,
                child: const Text('Confirm'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class TransferAccountPage extends StatefulWidget {
  final List<Map<String, String>> allCustomer;
  const TransferAccountPage({super.key, required this.allCustomer});

  @override
  State<TransferAccountPage> createState() => _TransferAccountPageState();
}

class _TransferAccountPageState extends State<TransferAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        leading: buildBackButton(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            child: Text(''),
          )
        ],
      )),
    );
  }
}
