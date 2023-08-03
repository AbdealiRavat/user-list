import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../card/componets/profile.dart';
import '../card/controller/api_controller.dart';
import '../card/info_card.dart';
import 'home_page.dart';

class UserDetails extends StatelessWidget {
  String name;
  String email;
  String imgUrl;
  UserDetails({super.key, required this.name, required this.email, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             Profile(
            imgUrl: imgUrl,
          ),
          SizedBox(height: 20,),
          Text(name, style: TextStyle(fontSize: 30, ),),
          Text(email),
        ],
      )),
    );
  }
}
