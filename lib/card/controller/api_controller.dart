

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController extends GetxController{

  List<dynamic> post = [].obs; // List to store API data
  RxInt page = 1.obs; // Current page number for API pagination
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
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
  
        post.addAll(apiData); // Add fetched data to the 'post' list
    
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


}