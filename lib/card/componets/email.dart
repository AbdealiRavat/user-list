// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required this.emailId,
  }) : super(key: key);

  final String emailId; // Email Id to display

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        emailId, // Display the email Id of the user.
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
