import 'package:app/features/home/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final ImageModel img;
  const ImageCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Card(
              elevation: 10,
              color: Colors.white,
              child: Image.asset(img.imagePath, fit: BoxFit.cover)),
        ),
        const SizedBox(height: 10),
        Text(
          img.foodName,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
