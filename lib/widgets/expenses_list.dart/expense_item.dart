import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(168, 33, 149, 243),
                Color.fromARGB(172, 222, 221, 221)
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(expense.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0)),
              
              const SizedBox(height: 4),

              Text(expense.categoty.name, style: TextStyle(
                          color: isDarkMode 
                           ? Theme.of(context).colorScheme.primary 
                          : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.35),)),
              
              Row(
                children: [

                  Text('\$${expense.amount.toStringAsFixed(2)}',
                  
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0)),
                          
                  const Spacer(),

                  Row(
                    children: [
                      Icon(
                        categoryIcons[expense.categoty],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.35),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        expense.formattedDate,
                        style: TextStyle(
                          color: isDarkMode 
                           ? Theme.of(context).colorScheme.primary 
                          : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.35),
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
