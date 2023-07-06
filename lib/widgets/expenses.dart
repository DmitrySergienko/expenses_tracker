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

  //remove item from the list
  void _removeExspense(Expense expense) {
    //to get the index of the item
    final expenseIndex = _registredExpences.indexOf(expense);

    setState(() {
      _registredExpences.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registredExpences.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  void _onActionPressed() {
    showModalBottomSheet(
      isScrollControlled: true, //to ocupade full screen
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
    //show message if no expenses
    Widget mainContent = const Center(
      child: Text('No expenses. Start adding some!'),
    );

    if (_registredExpences.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registredExpences, onRemoveExpesnse: _removeExspense);
    }

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
          child: mainContent,
        ),
      ]),
    );
  }
}
