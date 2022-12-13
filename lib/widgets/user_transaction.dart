import './new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "t1", title: 'New shoes', amount: 699.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: 'New watch', amount: 690.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: 'New earbuds', amount: 190.99, date: DateTime.now()),
    Transaction(
        id: "t4", title: 'New shirt', amount: 109.99, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addNewTransaction), TransactionList(_transactions)],
    );
  }
}
