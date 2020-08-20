import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({
    @required this.transactions,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No item added yet',
                  style: TextStyle(color: Colors.amber, fontSize: 26.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    'image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 40.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Text(
                            'NGN: ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
