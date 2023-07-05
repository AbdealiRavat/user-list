// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  const Phone({
    Key? key,
    required this.number,
  }) : super(key: key);
  // Define a constant constructor for the Airline widget which requires a 'name' parameter.

  final String number; // The name of the airline.

  @override
  Widget build(BuildContext context) {
    return Text(
      '+91 $number', // Display the airline's name.
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
