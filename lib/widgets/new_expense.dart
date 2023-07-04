
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class NewExpense extends StatefulWidget {
  const NewExpense({ Key? key }) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}



class _NewExpenseState extends State<NewExpense> {

  //to keep input value
  var _entiredValue ='';

  void _saveTitleInput(String inputValue){
    _entiredValue = inputValue;
  }



  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title')
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: (){
                print(_entiredValue);
              },
               child: const Text('Save Expense'))
          ],),
        ],
      ),
    );
  }
}