import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {

  //add color scheme
  var kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(121, 5, 163, 220)
    );

  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,

        //add card scheme
        cardTheme: CardTheme(
          // Set any attributes of CardTheme you want here. 
          // As an example, I'm setting color and shape here.
          color: Colors.blue,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        //add button scheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onPrimaryContainer,
            fontSize: 18
          )
        )
      ),
      home: const Expenses(),
    ),
  );
}
