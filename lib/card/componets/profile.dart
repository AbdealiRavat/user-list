import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({
    Key? key,
    required this.imgUrl,
    required this.height,
  }) : super(key: key);

  final String imgUrl; // Profile Image to display
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          border: Border.all(color: Colors.deepPurpleAccent, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          imgUrl, // Path to the asset image
          height: height,
          width: height,

          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
