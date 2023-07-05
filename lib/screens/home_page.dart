import 'package:flutter/material.dart';

import '../card/info_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static List<Widget> _widgetOptions = <Widget>[
  // Container(padding: EdgeInsets.symmetric(horizontal: 14), child: InfoCard()),
  // Text(
  //   'Index 2: School',
  //   style: optionStyle,
  // ),
  // Container(padding: EdgeInsets.symmetric(horizontal: 14), child: FormPage()),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      // Implementing Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF280036),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        centerTitle: true,
        title: const Text(
          'Users List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14), child: const InfoCard()),

        // _widgetOptions.elementAt(
        //     _selectedIndex)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
