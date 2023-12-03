import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferHistoryPage extends StatelessWidget {
  List<History> stocksList = [
    History("Felix", "2023-05-12", -500000),
    History("Shinzi", "2023-04-24", 900000),
    History("Gabriel", "2023-04-6", -50000),
    History("Hanson", "2023-03-17", 76890),
    History("Jonathan", "2023-03-13", 86000),
    History("Javier", "2023-01-12", 700000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Transfer"),
        backgroundColor: const Color(0xFF363636),
      ),
      body: ListView.builder(
        itemCount: stocksList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.only(
                        top: 4, right: 10, bottom: 4, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stocksList[index].history_date,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              stocksList[index].history_name,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Row(
                              children: [
                                Text(
                                  formatPrice(
                                      stocksList[index].history_currency),
                                  style: TextStyle(
                                    color: getCurrencyColor(
                                        stocksList[index].history_currency),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String formatPrice(double value) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return formatter.format(value);
  }

  Color getCurrencyColor(double margin) {
    return margin < 0 ? Colors.red : Colors.green;
  }
}

class History {
  final String history_name;
  final String history_date;
  final double history_currency;

  History(this.history_name, this.history_date, this.history_currency);
}
