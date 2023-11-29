import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:abank_project/pages/myaccount/my_account.dart';
import 'package:intl/intl.dart';

class SetALimit extends StatelessWidget {
  const SetALimit({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _limitTransfer =
        TextEditingController(text: 'Rp. 5.000.000');
    TextEditingController _limitPenarikan =
        TextEditingController(text: 'Rp. 2.000.000');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF363636),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Set A Limit"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 150,
              width: 200,
              margin: const EdgeInsets.only(top: 50, bottom: 10, left: 0),
              padding: const EdgeInsets.all(20),
              child: Image.asset('icons/credit-limit.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Transfer Limits",
                    style: TextStyle(fontSize: 24, color: Color(0xFFD9D9D9)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: _limitTransfer,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          12), // Batas maksimum panjang input
                      // CurrencyInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: '5000000',
                      // prefixText: 'Rp ',
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                    ),
                    onChanged: (value) {
                      _limitTransfer.value = _limitTransfer.value.copyWith(
                        text: formatCurrency(value),
                        selection: TextSelection.collapsed(
                            offset: formatCurrency(value).length),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Withdrawal Limits",
                    style: TextStyle(fontSize: 24, color: Color(0xFFD9D9D9)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: _limitPenarikan,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          12), // Batas maksimum panjang input
                      // CurrencyInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: '2000000',
                      // prefixText: 'Rp ',
                      filled: true,
                      fillColor: const Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                    ),
                    onChanged: (value) {
                      _limitPenarikan.value = _limitPenarikan.value.copyWith(
                        text: formatCurrency(value),
                        selection: TextSelection.collapsed(
                            offset: formatCurrency(value).length),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: MaterialButton(
                    color: const Color.fromARGB(255, 70, 172, 254),
                    onPressed: () {
                      // Implementasi logika untuk tombol Save
                    },
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 50, left: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    color: const Color(0xFFD9D9D9),
                    onPressed: () {
                      // Menghapus teks pada semua TextField
                      _limitPenarikan.text = 'Rp. 2.000.000';
                      _limitTransfer.text = 'Rp. 5.000.000';
                    },
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 45, left: 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatCurrency(String value) {
    final numberFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    try {
      final intValue = int.parse(value);
      return numberFormat.format(intValue);
    } catch (e) {
      return '';
    }
  }
}

// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     int value = int.parse(newValue.text);
//     final currency = NumberFormat.simpleCurrency();
//     String newText = currency.format(value / 100);

//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }
