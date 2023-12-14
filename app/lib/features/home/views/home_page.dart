import 'package:app/features/home/views/food_caraousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 40),
            FloatingActionButton(
              child: const Icon(Icons.camera, size: 45),
              onPressed: () {},
            ),
          ],
        ),
        appBar: AppBar(
          toolbarHeight: 127,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 10),
            Image.asset(
              "assets/logo.png",
              height: 128,
            )
          ]),
        ),
        body: const Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 100,
                ),
                Text("We recognize: ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ],
            ),
            FoodCarousel(),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "Trouble Recognizing the food?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Tap Below!",
                  style: TextStyle(fontSize: 18),
                )
              ],
            )
          ],
        ));
  }
}
