import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:abank_project/widgets_and_functions/build_back_button.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
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
                autofocus: false,
                controller: _textEditingController,
                focusNode: _focusNode,
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
                        _showDialog(
                            context, 'Added', 'Account added to Account List');
                        _textEditingController.clear();
                        _focusNode.unfocus();
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

Future<void> _showDialog(BuildContext context, String title, String text) {
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
