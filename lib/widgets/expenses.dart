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

  void _onActionPressed(){
    showModalBottomSheet(
      context: context,
       builder:  (cxt) => const NewExpense(),
       );
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //add appBar
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed:  _onActionPressed,
             icon: const Icon(Icons.add
             ))
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
