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
  List<dynamic> post = []; // List to store API data
  int page = 1; // Current page number for API pagination
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener); // Add scroll listener
    apiCall(); // Make API call to fetch initial data
  }

  Future<void> apiCall() async {
    final url = Uri.parse(
        'http://api.anviya.in/getUsers.php?page=$page'); // API endpoint URL
    final response = await http.get(url); // Send GET request to the API
    if (response.statusCode == 200) {
      final apiData = json.decode(response.body)['data']['users']
          as List<dynamic>; // Extract the user data from API response
      setState(() {
        post.addAll(apiData); // Add fetched data to the 'post' list
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page += 1; // Increment the page number for the next API call
      apiCall(); // Make API call to fetch more data
    }
  }

  @override
  Widget build(BuildContext context) {
    if (post.isEmpty) {
      // Show a loading indicator while data is being fetched
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemCount: post.length,
      itemBuilder: (BuildContext context, int index) {
        final imgUrl = post[index]['profileImage']; // Extract image URL
        final name = post[index]['name']; // Extract name
        final email = post[index]['email']; // Extract email
        final phone = post[index]['phone']; // Extract phone number

        return InkWell(
          onTap: () {
            Fluttertoast.showToast(
              msg:
                  'InfoCard $index clicked', // Show a toast message when a card is clicked
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserName(name: name),
                      Email(emailId: email),
                      Phone(number: phone),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
