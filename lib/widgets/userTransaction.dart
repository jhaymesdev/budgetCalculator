import 'package:flutter/material.dart';
import '../widgets/transactionList.dart';
import '../widgets/newTransaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransaction = [
    Transaction(id: "t1", title: "new shoe", amount: 4.0, date: DateTime.now()),
    Transaction(
        id: "t1", title: "bags of money", amount: 4.0, date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "whatever i wanna buy",
        amount: 4.0,
        date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final newtx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      userTransaction.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(userTransaction)
      ],
    );
  }
}
