import 'package:expenses_tracker/widgets/expenses_list.dart/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

  onPressed(){}
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpences = [
    Expense(
        title: 'Flutter course',
        amount: 19.9,
        date: DateTime.now(),
        categoty: Category.leisure),
    Expense(
        title: 'Dummy exp',
        amount: 19.9,
        date: DateTime.now(),
        categoty: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //add appBar
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),

      body: Column(children: [
        const Text('Some text'),
        // to show list on the screen, the list should be inside Expanded() function
        Expanded(
          child: ExpensesList(expenses: _registredExpences),
        ),
      ]),
    );
  }
}
