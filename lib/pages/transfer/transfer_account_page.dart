import 'package:flutter/material.dart';
import 'package:abank_project/widgets_and_functions/build_back_button.dart';

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
