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
        backgroundColor: Color(0xFF280036),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        centerTitle: true,
        title: Text(
          'Users List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(25.0),
      //     topRight: Radius.circular(25.0),
      //   ),
      //   child: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //           label: 'Home',
      //           icon: Icon(
      //             Icons.home,
      //           )),
      //       BottomNavigationBarItem(
      //           label: 'Music', icon: Icon(Icons.music_note)),
      //       BottomNavigationBarItem(
      //           label: 'Form', icon: Icon(Icons.format_align_justify)),
      //     ],
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.deepPurple,
      //     onTap: _onItemTapped,
      //   ),
      // ),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14), child: InfoCard()),

        // _widgetOptions.elementAt(
        //     _selectedIndex)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
