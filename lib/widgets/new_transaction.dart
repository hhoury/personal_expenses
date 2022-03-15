import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTrx;
  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addTrx);

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
              // onChanged: (title) {
              //   titleInput = title;
              // }
            ),
            TextField(
              controller: amountController,
              // onChanged: (amount) {
              //   amountInput = amount;
              // },
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  addTrx(titleController.text, double.parse(amountController.text));
                  }),
          ],
        ),
      ),
    );
  }
}
