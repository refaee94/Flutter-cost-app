import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransacionList extends StatelessWidget {
  TransacionList(this.transactions, this.deleteTx);
  final Function deleteTx;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
   return
     transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'There is no transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(6),
                  elevation: 7,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: FittedBox(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('\$${transactions[index].amount}'))),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width>400? FlatButton.icon(onPressed: ()=>deleteTx(transactions[index].id), icon:Icon(Icons.delete), label:Text('Delete'),textColor:Theme.of(context).errorColor ,) : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
          
    );
  }
}
