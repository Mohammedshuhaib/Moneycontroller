import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: 'New shoes', amount: 699.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: 'New watch', amount: 690.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: 'New earbuds', amount: 190.99, date: DateTime.now()),
    Transaction(
        id: "t4", title: 'New shirt', amount: 109.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child:
                  Container(width: double.infinity, child: const Text("CHART")),
              elevation: 5,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                          decoration: InputDecoration(labelText: "title")),
                      TextField(
                        decoration: InputDecoration(labelText: "amount"),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white),
                              onPressed: () {},
                              child: Text("Add transactions")))
                    ]),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('₹${tx.amount}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ]),
                );
              }).toList(),
            )
          ],
        ));
  }
}
