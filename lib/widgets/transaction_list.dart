// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Text('No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          }))
        : ListView(
            children: transactions
                .map((trx) =>
                    TransactionItem(
                      key: ValueKey(trx.id)  ,
                      transaction: trx,
                       deleteTx: deleteTx))
                .toList());

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
    // },
    // itemCount: transactions.length,
    // );
  }
}
