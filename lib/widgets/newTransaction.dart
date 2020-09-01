import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate(){
    final controlledTitle = titleController.text;
    final controlledAmount = double.parse(amountController.text);
    if(controlledTitle.isEmpty || controlledAmount<0){
      return;
    }
    widget.addNewTx(
      controlledTitle,
      controlledAmount,
    );
    Navigator.of(context).pop();
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
            onSubmitted: (_) =>submitDate(),
          ),
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) =>submitDate(),
          ),
          FlatButton(onPressed: submitDate, child: Text("Add transaction"))
        ],
      ),
    );
  }
}
