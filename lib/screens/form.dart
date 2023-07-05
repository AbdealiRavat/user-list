import 'package:demo_page/card/componets/my_text_field.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        MyTextField(
          label: 'Username',
          hint: 'Enter Username',
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          label: 'FirstName',
          hint: 'Enter FirstName',
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          label: 'LastName',
          hint: 'Enter LastName',
        ),
      ],
    );
  }
}
