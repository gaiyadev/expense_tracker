import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageTotal;
  ChartBar({
    this.label,
    this.spendingAmount,
    this.spendingPercentageTotal,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.0,
          child: FittedBox(
            child: Text(
              'N ${spendingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // color: Color.fromRGBO(220, 220, 220, 1),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(label),
      ],
    );
  }
}
