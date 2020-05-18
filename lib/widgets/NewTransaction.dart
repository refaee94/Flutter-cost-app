import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTX);

  final Function addTX;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
DateTime selectedDate;
  final titleController = TextEditingController();

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
              selectedDate=value;

      });


    });
  }

  @override
  Widget build(BuildContext context) {
    final submitData = () {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0||selectedDate==null)
       return;
      widget.addTX(enteredTitle, enteredAmount,selectedDate);
      Navigator.of(context).pop();
    };
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) => submitData),
            Container(
              height: 70,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(selectedDate==null?'No Choosen date':DateFormat.yMMMd().format(selectedDate)),
                  FlatButton(
                    onPressed: presentDatePicker,
                    child: Text(
                      'Choose a date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add transaction',
                ),
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
