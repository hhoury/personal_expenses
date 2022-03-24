
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _chosenBg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const availableColors =[
      Colors.red,
    Colors.black,
    Colors.blue,
    Colors.purple
    ];
    _chosenBg = availableColors[Random().nextInt(4)];
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        //can be replaced with container with decoration boxDecoration
        //shape: boxshape.circle with heigh = width
        leading: CircleAvatar(
          backgroundColor: _chosenBg,
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                  child: Text('\$${widget.transaction.amount}'))),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle:
            Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const  Icon(Icons.delete),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).errorColor),
                label: const Text('Delete'),
              )
            : IconButton(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
