// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class Airline extends StatelessWidget {
  const Airline({
    Key? key,
    required this.name,
  }) : super(key: key);
  // Define a constant constructor for the Airline widget which requires a 'name' parameter.

  final String name; // The name of the airline.

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name, // Display the airline's name.
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
