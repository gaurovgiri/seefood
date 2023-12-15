import 'package:app/core/api.dart';
import 'package:app/features/home/model/image_model.dart';
import 'package:app/features/home/views/image_card.dart';
import 'package:flutter/material.dart';

class RecognizedPage extends StatelessWidget {
  final String imagePath;
  const RecognizedPage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    final capturedImage =
        ImageModel(foodName: "I don't know", imagePath: imagePath);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 127,
          title: Row(children: [
            const SizedBox(
              width: 60,
            ),
            Image.asset(
              "assets/logo.png",
              height: 128,
            )
          ]),
        ),
        body: FutureBuilder<String>(
            future: FoodAPIRequest.postFoodRecognitionRequest(imagePath),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                capturedImage.foodName = snapshot.data ?? "";
                return Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text("The food is likely to be",
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 25),
                    Center(child: ImageCard(img: capturedImage)),
                  ],
                );
              }
            }));
  }
}
