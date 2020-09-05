import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //this is to make sure the transaction is only within a week
      //i.e (present date )- the transaction was created
      var totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      print(totalAmount);
      return {
        "Day": DateFormat.E().format(weekDay).substring(0, 2),
        "Amount": totalAmount
      };
    });
  }
  double get maxSpending {
    return groupedTransactionValues.fold(
        0.0, (previousValue, element) => previousValue + element["Amount"]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((e) {
              return Flexible(
                child: ChartBar(
                    e["Day"],
                    e["Amount"],
                    maxSpending == 0.0
                        ? 0.0
                        : (e["Amount"] as double) / maxSpending),
                fit: FlexFit.tight,
              );
            }).toList()),
      ),
    );
  }
}
