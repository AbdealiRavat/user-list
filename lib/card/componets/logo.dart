import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          clipBehavior:
              Clip.hardEdge, // Clip the container's content to its shape
          width: 60,
          height: 120,
          decoration: BoxDecoration(
              color: Color(0xFF232323)), // Set the container's background color
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              imgUrl, // Path to the asset image
              height: 70,
              fit: BoxFit
                  .cover, // Fit the image within the container by covering it
            ),
          ),
        )
      ],
    );
  }
}
