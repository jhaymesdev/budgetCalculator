import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  List<Transaction> userTransaction ;
  TransactionList(this.userTransaction);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransaction.map((tx) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  tx.amount.toString(),
                  style: TextStyle(
                    fontSize: 20.0,

                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    )),
                padding: EdgeInsets.all(9.0),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(DateFormat.yMMMEd().format(tx.date)),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
