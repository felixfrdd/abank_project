import 'package:abank_project/firebase/firestore_user_new_bank_account.dart';
import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abank_project/widgets_and_functions/build_back_button.dart';
import 'package:flutter/services.dart';

class NewAccountPage extends StatefulWidget {
  final Function fetchData;

  const NewAccountPage({Key? key, required this.fetchData}) : super(key: key);

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final _newAccountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirestoreUserNewBankAccount _firestoreNewAcc =
      FirestoreUserNewBankAccount();

  @override
  void dispose() {
    _newAccountController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: TextFormField(
                    controller: _newAccountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
                    autofocus: false,
                    focusNode: _focusNode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (accNum) {
                      if (accNum != null && accNum.length < 10) {
                        return 'Minimum 10 numbers required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.group_add_sharp,
                        size: 28,
                        color: Colors.black,
                      ),
                      hintText: 'Account Number',
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      contentPadding: const EdgeInsets.all(15),
                      isCollapsed: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 56, 56, 56)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 56, 56, 56)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: const Color(0xFF4B4B4B),
                        splashColor: Colors.transparent,
                        splashRadius: 20.0,
                        onPressed: () {
                          _newAccountController.clear();
                        },
                      ),
                      errorStyle: const TextStyle(fontSize: 15),
                      errorMaxLines: 2,
                    ),
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
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) return;
                    try {
                      if (await _firestoreNewAcc.isMyOwnAccountNumber(
                        FirebaseAuth.instance.currentUser!.email!,
                        _newAccountController.text,
                      )) {
                        _focusNode.unfocus();
                        showErrorSnackBar(
                            context, 'Cannot add your own account number');
                        return;
                      } else if (await _firestoreNewAcc.isAvailableNewAccNum(
                            FirebaseAuth.instance.currentUser!.email!,
                            _newAccountController.text,
                          ) &&
                          await _firestoreNewAcc.isAccNumNotExistInCurrentUser(
                            _newAccountController.text,
                            FirebaseAuth.instance.currentUser!.email!,
                          )) {
                        await _firestoreNewAcc.storeNewAccount(
                            FirebaseAuth.instance.currentUser!.email!,
                            await _firestoreNewAcc
                                .whoseAccNumber(_newAccountController.text),
                            _newAccountController.text);
                      } else {
                        _focusNode.unfocus();
                        showErrorSnackBar(
                            context, 'Account already exist in the list');
                        return;
                      }
                    } catch (e) {
                      _focusNode.unfocus();
                      showErrorSnackBar(context, 'No account found');
                      return;
                    }
                    _showDialog(
                        context, 'Added', 'Account added to Account List');
                    _newAccountController.clear();
                    _focusNode.unfocus();
                    await widget.fetchData();
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ),
          ],
        ),
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
