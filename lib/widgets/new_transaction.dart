// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrx;
  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addTrx){
    print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState(){
    print('createState NewTransaction Widget');
    return _NewTransactionState();
    }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState(){
    print('constructor _NewTransactionState');
  }

  @override
  void initState() {
    // TODO: implement initState
    //often used to make http requests and load data from server/database
    print('initState()');
    super.initState();
    
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTrx(enteredTitle, enteredAmount, _selectedDate);
    //close the top most screen displayed
    //here it is the modal sheet
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
      print('...');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() NewTransaction');
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (title) {
                //   titleInput = title;
                // }
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (amount) {
                //   amountInput = amount;
                // },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: _presentDatePicker,
                          )
                        : TextButton(
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: _presentDatePicker,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                  ],
                ),
              ),
              ElevatedButton(
                  child: Text(
                    'Add Transaction',
                  ),
                  // st   ackgroundColor: Theme.of(context).primaryColor),
                  onPressed: _submitData),
            ],
          ),
        ),
      ),
    );
  }
}
