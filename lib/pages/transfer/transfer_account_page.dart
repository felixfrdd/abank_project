import 'package:abank_project/firebase/firestore_user_bank_account.dart';
import 'package:abank_project/firebase/firestore_user_form.dart';
import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abank_project/widgets_and_functions/build_back_button.dart';
import 'package:flutter/services.dart';

class TransferAccountPage extends StatefulWidget {
  final String customerName;
  final String accNum;
  const TransferAccountPage(
      {super.key, required this.customerName, required this.accNum});

  @override
  State<TransferAccountPage> createState() => _TransferAccountPageState();
}

class _TransferAccountPageState extends State<TransferAccountPage> {
  final _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirestoreUserNewBankAccount _firestoreNewAcc =
      FirestoreUserNewBankAccount();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {});
  }

  @override
  void dispose() {
    _amountController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('to ${widget.customerName}'),
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
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
                    autofocus: false,
                    focusNode: _focusNode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (accNum) {
                      if (accNum != null && accNum.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      prefixStyle: const TextStyle(color: Colors.black),
                      hintText: 'Amount',
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
                          _amountController.clear();
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
                    String amount = _amountController.text;
                    _firestoreNewAcc.calculateBalanceForSender(
                        FirebaseAuth.instance.currentUser!.email!,
                        int.parse(amount));
                    _firestoreNewAcc.calculateBalanceForReceiver(
                        widget.accNum, int.parse(amount));
                    showNeutralSnackBar(context, 'Transfer success');
                    _amountController.clear();
                    _focusNode.unfocus();
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
