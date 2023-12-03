import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Invest extends StatelessWidget {
  Invest({super.key});
  List<Stocks> stocksList = [
    Stocks("COMPOSITE", 7059906, -0.29),
    Stocks("LQ45", 939707, 1.04),
    Stocks("IDX30", 487431, 1.49),
    Stocks("IDX80", 129663, 0.95),
    Stocks("MBX", 208.591, -0.52),
    Stocks("IDXLQ45LCL", 129998, 1.52),
    Stocks("IDXESGL", 145193, -0.29),
    Stocks("IDXV30", 125725, 0.64),
    Stocks("IDXG30", 154689, 0.33),
    Stocks("IDXHIDIV20", 560665, 1.05),
    Stocks("ISSI", 208591, -0.52),
    Stocks("IDXQ30", 157788, 0.83),
    Stocks("IDXINDUST", 1091148, 1.4),
    Stocks("SMInfra18", 310573, -0.12),
    Stocks("PEFINDO25", 220834, -1.03),
    Stocks("IDXINFRA", 1504726, -0.71),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Invest & Stocks"),
        backgroundColor: const Color(0xFF363636),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: (stocksList.length / 2).ceil(),
          itemBuilder: (context, index) {
            int startIndex = index * 2;
            int endIndex = (index + 1) * 2;
      
            return Row(
              children: stocksList
                  .sublist(
                    startIndex,
                    endIndex > stocksList.length ? stocksList.length : endIndex,
                  )
                  .map(
                    (item) => Expanded(
                      child: Card(
                        
                        margin: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          
                          padding: const EdgeInsets.only(top: 4,bottom: 4, left: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.stocks_name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(formatPrice(item.stocks_price)),
                                  Row(
                                    children: [
                                      Text(
                                        formatMargin(item.stocks_margin),
                                        style: TextStyle(
                                          color: getMarginColor(item.stocks_margin),
                                          fontSize: 12,
                                        ),
                                      ),
                                      getMarginIcon(item.stocks_margin)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  String formatPrice(double value) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return formatter.format(value);
  }

  String formatMargin(double margin) {
    return "${margin.toStringAsFixed(2)}%";
  }

  Color getMarginColor(double margin) {
    return margin < 0 ? Colors.red : Colors.green;
  }

  Icon getMarginIcon(double margin){
    return margin < 0 ? const Icon(Icons.arrow_drop_down, color: Colors.red,) : const Icon(Icons.arrow_drop_up, color: Colors.green,);
  }
}

class Stocks {
  final String stocks_name;
  final double stocks_price;
  final double stocks_margin;

  Stocks(this.stocks_name, this.stocks_price, this.stocks_margin);
}
