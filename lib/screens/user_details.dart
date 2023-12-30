import 'package:flutter/material.dart';

import '../card/componets/profile.dart';

class UserDetails extends StatelessWidget {
  String id;
  String name;
  String email;
  String imgUrl;
  UserDetails(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey.shade800,
            )),
        title: const Text(
          'Users Details',
          style: TextStyle(color: Color(0xFF280036)),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: id,
            child: Profile(imgUrl: imgUrl, height: 120),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Text(email),
        ],
      )),
    );
  }
}
