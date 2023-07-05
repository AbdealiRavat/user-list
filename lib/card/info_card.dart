import 'dart:convert';

import 'package:demo_page/card/componets/logo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'componets/airline.dart';
import 'componets/name.dart';
import 'componets/trips.dart';

class InfoCard extends StatefulWidget {
  InfoCard({Key? key}) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  List<dynamic>? apiData;

  get contoller => null; // Stores the fetched API data

  @override
  void initState() {
    super.initState();
    apiCall(); // Call the API when the widget is initialized
  }

  Future apiCall() async {
    var url = Uri.parse('http://api.anviya.in/getUsers.php?page=1');

    var response = await http.get(url); // Make an HTTP GET request to the API
    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        apiData = json.decode(response.body)['data']
            ['users']; // Store the fetched data in the 'apiData' variable
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (apiData == null) {
      // Show a loading indicator while data is being fetched
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: apiData!.length,
      itemBuilder: (BuildContext context, int index) {
        var imgUrl = apiData![index]['profileImage'];
        var name =
            apiData![index]['name']; // Extract the 'name' from the API data
        var trips = apiData![index]['email'];
        var airline =
            apiData![index]['phone']; //// Extract the 'trips' from the API data
        // var airlineName = apiData![index]['airline'][0]
        //     ['name']; // Extract the 'airline' name from the API data

        return InkWell(
          onTap: () {
            Fluttertoast.showToast(
              msg: 'InfoCard $index clicked',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP_LEFT,
              timeInSecForIosWeb: 1,
            );
            print('InfoCard $index clicked');
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              right: 20,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  color: Colors.grey.shade300,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Logo(
                  imgUrl: imgUrl,
                ), // Widget to display the logo and background
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserName(name: name), // Widget to display the user's name
                    Trips(
                        count: trips), // Widget to display the number of trips
                    Airline(
                        name: airline), // Widget to display the airline name
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
