import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, work, leisure }

const categoryIcons ={
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,

};

class Expense {
  Expense(
      {required this.categoty,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category categoty;

  String get formattedDate{
return formatter.format(date);
  }

}

// to get sum for each cutegory for charts
class ExpenseBucket{
  
const ExpenseBucket({required this.category, required this.expenses});

// is a named constructor that creates an ExpenseBucket where the expenses list only includes the expenses from allExpenses that match the specified category.
ExpenseBucket.forCategory(List<Expense> allExpesnses, this.category)
  :expenses = allExpesnses.where((item) => item.categoty == category).toList();


  final Category category;
  final List<Expense> expenses;


  double get totalExpenses {
    double sum = 0;
    
    for (final i in expenses){
      sum = sum + i.amount;

    } return sum;
  }
}