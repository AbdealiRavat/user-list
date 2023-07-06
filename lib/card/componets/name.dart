// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// The above comment ignores linting rules related to preferring const constructors and literals to create immutables.

import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name; // The name of the user.

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        name, // Display the name of the user.

        style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1),
      ),
    );
  }
}
