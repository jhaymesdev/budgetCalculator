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
  void submitDate() {
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
  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate == value;
      });
    });
  }

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
            onSubmitted: (_) => submitDate(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitDate(),
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
              FlatButton.icon(
                  onPressed: datePicker,
                  icon: Icon(Icons.calendar_today),
                  label: Text(
                   "Choose Date",
                    style: TextStyle(
                        color: Colors.lightBlue, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          FlatButton(onPressed: submitDate, child: Text("Add transaction"))
        ],
      ),
    );
  }
}
