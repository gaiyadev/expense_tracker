import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Card(
            child: Text(
              'CHART',
            ),
          ),
          Card(
            child: Text(
              'transactions',
            ),
          )
        ],
      ),
    );
  }
}
