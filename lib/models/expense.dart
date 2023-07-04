import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, work, leisure }

class Expense {
  Expense(
      {required this.categoty,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();

  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final String categoty;
}
