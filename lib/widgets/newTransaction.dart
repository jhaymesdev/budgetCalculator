import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addNewTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addNewTx);

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
          ),
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
          ),
          FlatButton(onPressed: () {
            addNewTx(titleController.text, double.parse(amountController.text));

          }, child: Text("Add transaction"))
        ],
      ),
    );
  }
}
