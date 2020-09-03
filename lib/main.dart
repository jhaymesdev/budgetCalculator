import 'dart:ffi';
import 'dart:io';

import './widgets/chart.dart';

import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';

import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> userTransaction = [
    // Transaction(id: "t1", title: "new shoe", amount: 4.0, date: DateTime.now()),
    // Transaction(
    //     id: "t1", title: "bags of money", amount: 4.0, date: DateTime.now()),
    // Transaction(
    //     id: "t1",
    //     title: "whatever i wanna buy",
    //     amount: 4.0,
    //     date: DateTime.now())
  ];
  //It was recent transaction not all transactions
  List<Transaction> get recentTransaction {
    return userTransaction.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
    //try using a forLoop here I am exhausted frfr
  }

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
  void startAddNewTrans(BuildContext cntxt) {
    showModalBottomSheet(
        context: cntxt,
        builder: (builderCntxt) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar",
        ),
        //centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add), onPressed: () => startAddNewTrans(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Chart(recentTransaction),
            TransactionList(userTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTrans(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        color: Colors.red,
      ),
    );
  }
}
