import 'dart:convert';

import 'package:demo_page/card/card_container.dart';
import 'package:demo_page/card/componets/profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'componets/email.dart';
import 'componets/name.dart';
import 'componets/phone.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  // List<dynamic>? apiData;
  List post = [];
  int page = 1;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    apiCall();
  }

  Future apiCall() async {
    var url = Uri.parse('http://api.anviya.in/getUsers.php?page=$page');
    print('url');
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final apiData = json.decode(response.body)['data']['users'] as List;
      setState(() {
        post = post + apiData;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      apiCall();
    } else {
      // print('Scroll Listener Not called');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (post == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemCount: post!.length,
      itemBuilder: (BuildContext context, int index) {
        var imgUrl = post[index]['profileImage'];
        var name = post[index]['name'];
        var email = post[index]['email'];
        var phone = post[index]['phone'];

        return InkWell(
          onTap: () {
            Fluttertoast.showToast(
              msg: 'InfoCard $index clicked',
            );
            print('InfoCard $index clicked');
          },
          child: CardContainer(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Profile(
                imgUrl: imgUrl,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserName(name: name),
                    Email(emailId: email),
                    Phone(number: phone),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
