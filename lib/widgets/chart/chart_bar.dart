import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.fill,
    required this.labelValue,
    required this.categoryName,
  }) : super(key: key);

  final double fill;

  final String labelValue;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          child: FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                color: isDarkMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.35),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(labelValue, style: TextStyle(color: Colors.white)),
                  Text(categoryName, style: TextStyle(color: Colors.white)),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
