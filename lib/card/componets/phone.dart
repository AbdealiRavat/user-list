// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  const Phone({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number; // Phone number to display

  @override
  Widget build(BuildContext context) {
    return Text(
      '+91 $number', // Display the phone number with a country code
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
