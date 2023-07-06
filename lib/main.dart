// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          textTheme:
              GoogleFonts.workSansTextTheme(Theme.of(context).textTheme)),

      debugShowCheckedModeBanner: false,
      title: 'User List',
      // Set the home page of the app
      home: MyHomePage(),
    );
  }
}
