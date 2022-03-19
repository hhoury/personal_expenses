// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    //can be replaced with container with decoration boxDecoration
                    //shape: boxshape.circle with heigh = width
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}'))),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         )),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                //             style: Theme.of(context).textTheme.titleMedium),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 16),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
