import 'package:expenses_tracker/widgets/expenses_list.dart/expenses_list.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  
  final List<Expense> _registredExpences = [];

  void _onActionPressed() {
    showModalBottomSheet(
      context: context,
      builder: (cxt) => NewExpense(
        onSave: (newExpense) {
          setState(() {
            _registredExpences.addAll(newExpense);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add appBar
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _onActionPressed, icon: const Icon(Icons.add))
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
