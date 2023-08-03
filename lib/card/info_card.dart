import 'package:demo_page/card/card_container.dart';
import 'package:demo_page/card/componets/profile.dart';
import 'package:demo_page/card/controller/api_controller.dart';
import 'package:demo_page/screens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componets/email.dart';
import 'componets/name.dart';
import 'componets/phone.dart';

class InfoCard extends StatelessWidget {
  InfoCard({Key? key}) : super(key: key);

  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) => Obx(() {
        if (apiController.post.isEmpty) {
          // Show a loading indicator while data is being fetched
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: apiController.scrollController,
          shrinkWrap: true,
          itemCount: apiController.post.length,
          itemBuilder: (BuildContext context, int index) {
            final imgUrl =
                apiController.post[index]['profileImage']; // Extract image URL
            final name = apiController.post[index]['name']; // Extract name
            final email = apiController.post[index]['email']; // Extract email
            final phone =
                apiController.post[index]['phone']; // Extract phone number

            return InkWell(
              onTap: () {
                // Fluttertoast.showToast(
                //   msg:
                //       'Details Page for $name', // Show a toast message when a card is clicked
                // );
                // print('InfoCard $index clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetails(
                              name: name,
                              email: email,
                              imgUrl: imgUrl,
                            )));
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
      });
}
