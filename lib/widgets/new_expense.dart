import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // //to keep input value
  // var _entiredValue ='';

  // void _saveTitleInput(String inputValue){
  //   _entiredValue = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amount =TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          

          TextField(
            //onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            //onChanged: _saveTitleInput,
            controller: _amount,
            maxLength: 10,
            decoration:  const InputDecoration(prefixText:'\$ ', label: Text('Amount')),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
            
          ),
          Row(
            children: [

               TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Clear')),

              ElevatedButton(
                  onPressed: () {
                    print(_titleController);
                  },
                  child: const Text('Save Expense')),
             
            ],
          ),
        ],
      ),
    );
  }
}
