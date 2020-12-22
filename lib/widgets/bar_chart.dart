import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart(this.expenses);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          'Weekly Spending',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back, size: 30), onPressed: () {}),
            Text(
              'Nov 10, 2019 - Nov 16, 2019',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward, size: 30), onPressed: () {})
          ],
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Su',
                  amountSpent: expenses[1],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Mo',
                  amountSpent: expenses[2],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Tue',
                  amountSpent: expenses[3],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Wed',
                  amountSpent: expenses[4],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Thu',
                  amountSpent: expenses[5],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Fri',
                  amountSpent: expenses[6],
                  mostExpensive: mostExpensive),
            ],
          ),
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;
  Bar({this.label, this.amountSpent, this.mostExpensive});
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.0),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
