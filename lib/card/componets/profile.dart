import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.deepPurpleAccent, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          imgUrl, // Path to the asset image
          height: 70,

          fit:
              BoxFit.cover, // Fit the image within the container by covering it
        ),
      ),
    );
  }
}
