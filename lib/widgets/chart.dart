import 'package:expens_app/models/transaction.dart';
import 'package:expens_app/widgets/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({this.recentTransactions});

  List<Map<String, Object>> get transactionListValues {
    return List.generate(7, (index) {
      double totalSum = 0;
      final weekDay = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }
 
 double get totalSpending {

   return transactionListValues.fold(0, (sum, element) {return sum+element['amount'];});
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(padding: EdgeInsets.all(10),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transactionListValues.map((data) {
              return Flexible(fit: FlexFit.tight,
                          child: ChartBar(data['day'], data['amount'],
                totalSpending==0?0: (data['amount'] as double)/totalSpending),
              );
            }).toList().reversed.toList(),
          ),
        ),
      ),
    );
  }
}
