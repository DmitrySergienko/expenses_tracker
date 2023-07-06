import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {

  const NewExpense({Key? key, required this.onSave}) : super(key: key);

  //create a callback to pass the list of epence to the exspense.dart screen
  final Function(List<Expense>) onSave;
  
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final List<Expense> listOfExpenses = [];

  final _titleController = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _selectedDate;
  Category _selectCategory = Category.leisure;

  //time picker
  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickerDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    //when the future date coming the action will be done
    setState(() {
      _selectedDate = pickerDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amount.dispose();
    super.dispose();
  }

  void _saveExpenseActions() {
    final entireAmount = double.tryParse(_amount.text);
    final amountIsValid = entireAmount == null || entireAmount <= 0;

    //show error
    if (_titleController.text.trim().isEmpty ||amountIsValid ||_selectedDate == null) {

      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text('Please complete fields'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ));
      return;
    }
    else{

    // if all fields completed

    //1.Add items to the list
    listOfExpenses.add(
      Expense(
          categoty: _selectCategory,
          title: _titleController.text.trim(),
          amount: entireAmount,
          date: _selectedDate!),
    );

    // Call the callback function passed from the parent widget
    widget.onSave(listOfExpenses);

    //2.Close the BottomDropDown screen
    Navigator.pop(context);
  }
}

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 68, 16, 16),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  //onChanged: _saveTitleInput,
                  controller: _amount,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', label: Text('Amount')),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                  value: _selectCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString().toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (category) {
                    if (category == null) {
                      return;
                    }
                    setState(() {
                      _selectCategory = category;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Clear')),
              ElevatedButton(
                  onPressed: () {
                    _saveExpenseActions();
                  },
                  child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
