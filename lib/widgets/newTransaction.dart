import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;
  void submitData() {
    final controlledTitle = titleController.text;
    final controlledAmount = double.parse(amountController.text);
    if (controlledTitle.isEmpty || controlledAmount < 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTx(
      controlledTitle,
      controlledAmount,
    );
    Navigator.of(context).pop();
  }


  //commit name is show date picker


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title of expense"),
            controller: titleController,
            scrollController: ScrollController(keepScrollOffset: false),
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? "Choose Date"
                      :"${ DateFormat.yMd().format(_selectedDate)}",
                ),
              ),
              FlatButton(
                 onPressed: (){
                     showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(2000), lastDate: DateTime.now()).then((value){
                       setState(() {
                         _selectedDate = value;
                       });
                     });

                 },
                child: Text(_selectedDate==null?"Choose Date":"change date"),
                  ),

            ],
          ),
          FlatButton(onPressed: submitData, child: Text("Add transaction"))
        ],
      ),
    );
  }
}
