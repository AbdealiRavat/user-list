// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required this.emailId,
  }) : super(key: key);
  // Define a constant constructor for the Trips widget which requires a 'count' parameter.

  final String emailId; // The number of trips.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emailId, // Display the count of trips.
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
