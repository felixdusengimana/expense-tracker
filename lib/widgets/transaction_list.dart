import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(children: [
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].dateTime),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(Icons.delete),
                    ),
                  );
                },
                itemCount: transactions.length,
                // children: <Widget>[
                //   ...transactions.map((tx) {

                //   }).toList()
                // ],
              ));
  }
}

/*
Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].dateTime),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                  */
