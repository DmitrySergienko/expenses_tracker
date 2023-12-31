import 'package:expenses_tracker/widgets/chart/chart.dart';
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
        amount: 12.9,
        date: DateTime.now(),
        categoty: Category.leisure),
    Expense(
        title: 'Dummy exp',
        amount: 19.9,
        date: DateTime.now(),
        categoty: Category.work),
  ];

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
      useSafeArea: true, // safe area not overlop the camera on top of the screen
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
        title: Row(
          children: [
            Image.asset(
              'assets/images/ic_banner_new.png',
              fit: BoxFit.cover,
              height: AppBar().preferredSize.height,
            ),
            const SizedBox(
                width: 6.0), // in case adjust the space to suit design
            const Text('Expense tracker'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _onActionPressed,
            icon: const Icon(Icons.add),
            color: const Color.fromARGB(255, 251, 101, 2),
          )
        ],
      ),

      body: Column(children: [
        Chart(expenses: _registredExpences),

        const Text('Expenses List'),
        // to show list on the screen, the list should be inside Expanded() function beacuse no high limit in the list
        Expanded(
          child: mainContent,
        ),
      ]),

      bottomNavigationBar: Container(
        color: Colors.grey[200], //you can set color here
        height: 50.0, //you can set a height
        alignment: Alignment.center,
        child: Text(
          'Created by techcarrot',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
