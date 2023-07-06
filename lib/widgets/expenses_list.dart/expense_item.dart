import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Color.fromARGB(172, 222, 221, 221)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title,style: const TextStyle(color: Colors.white, fontSize: 18.0)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}',style: const TextStyle(color: Colors.white, fontSize: 16.0)),
                  const Spacer(),
                  Row(children: [
                    Icon(categoryIcons[expense.categoty], color: Colors.white,),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate,style: const TextStyle(color: Colors.white, fontSize: 18.0))
                  ],),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
