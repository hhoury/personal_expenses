import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrx;
  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTrx(enteredTitle, enteredAmount);
    //close the top most screen displayed
    //here it is the modal sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (title) {
              //   titleInput = title;
              // }
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (amount) {
              //   amountInput = amount;
              // },
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
