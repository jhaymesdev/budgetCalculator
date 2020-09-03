import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransaction ;
  TransactionList(this.userTransaction);
  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty? Column(
      children: [
        Text("Omo you no buy anything since?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 15,),
        Image.asset("assets/images/waiting.png",fit: BoxFit.fill,)
      ],
    ):Container(
      height: 400,
      child: ListView.builder(
       itemBuilder: (context, index){
return Card(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        child: Text(
         "\$${userTransaction[index].amount.toStringAsFixed(1)}",
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
            userTransaction[index].title,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Text(DateFormat.yMMMEd().format(userTransaction[index].date)),
        ],
      )
    ],
  ),
);
       },
       itemCount: userTransaction.length,



      ),
    );
  }
}
