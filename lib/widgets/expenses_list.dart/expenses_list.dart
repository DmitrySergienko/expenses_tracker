import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list.dart/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpesnse});

  final List<Expense> expenses;

  //to remove item from the list
  final void Function(Expense expense) onRemoveExpesnse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, int index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpesnse(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );
  }
}
