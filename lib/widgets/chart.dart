import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  List<Map<String, Object>> get groupedTransactionValues {
    print('am inside');
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
              print(recentTransaction[i].amount);
              print('here it is');
              // totalSum += recentTransaction[i]?.amount;
            }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  const Chart(this.recentTransaction);

  @override
  Widget build(BuildContext context) {
    print("groupedTransactionValues $groupedTransactionValues");
    return Card(
        elevation: 6, margin: EdgeInsets.all(20), child: Row(children: []));
  }
}
