import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('chart'),
                  elevation: 5,
                ),
              ),
              Column(
                  children: transactions.map((trns) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.purple, style: BorderStyle.solid,),
                          ),
                          child: Text(
                            trns.amount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.purple),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(trns.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text(trns.date.toIso8601String(),style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                );
              }).toList())
            ],
          )),
    );
  }
}
