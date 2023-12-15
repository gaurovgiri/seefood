import 'dart:io';

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
          width: img.fromAssets ? null : 300,
          child: Card(
              elevation: 10,
              color: Colors.white,
              child: img.fromAssets
                  ? Image.asset(img.imagePath, fit: BoxFit.cover)
                  : Image.file(File(img.imagePath))),
        ),
        const SizedBox(height: 10),
        Text(
          img.foodName,
          style: TextStyle(
              fontSize: img.fromAssets ? 15 : 18,
              fontWeight: img.fromAssets ? FontWeight.normal : FontWeight.bold),
        )
      ],
    );
  }
}
